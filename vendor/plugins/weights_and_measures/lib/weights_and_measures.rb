# WeightsAndMeasures
module WeightsAndMeasures
  include WeightsAndMeasuresConstants
  attr_accessor :unit
  attr_writer :val
  class UndefinedUnitError < StandardError;end 
  module Base
    include WeightsAndMeasuresConstants
    attr_reader :value, :parts

    def unit; @unit ||= @parts.first; end
    def face_value; @face_value ||= @parts.last; end
    def long; to_s(:long); end

    def base_unit
      res = unit.to_s[-1,1]
      @base_unit = res.blank? ? res : res.to_sym
    end

    def prefix
      res = unit.to_s[0, unit.to_s.length-1]
      @prefix = res.blank? ? res : res.to_sym
    end
  
    def initialize(value, parts)
      @value, @parts = value, parts
    end

    def to_s(type = nil)
      s = "#{face_value}" 
      s << " #{unit}" if type.nil?
      s << " #{MULTIPLE_NAMES.assoc(prefix).last}#{UNITS.assoc(base_unit).last.pluralize}" if type.eql?:long
      s
    end

    def -(other)
      new(@value - other.value, [ unit, face_value - other.face_value ])
    end

    def *(other)
      other = Metric.new(other, [ unit, other ]) unless other.is_a?Metric
      if other.parts.first == unit
        Metric.new(value * other.value, [ unit, face_value * other.face_value ])
      else
        Metric.new(value * other.value, [ unit, face_value * (other.face_value * other.value/value) ])
      end
    end

    def +(other)
      other = Metric.new(other, [ unit, other ]) unless other.is_a?Metric
      Metric.new(value + other.value, [ unit, ((value + other.value)/ BASE.rassoc(prefix).first) ])
    end
  end

# Covertions based off 1lb

  def method_missing(sym, *args, &block)
    sym = sym.to_s.singularize.to_s
    #
    # Define the measurement or weight
    # 1.lb
    # alias the pluralized form
    # 1.lbs => 1.lb

    bu= sym[-1,1]
    p= sym[0, sym.length-1]
    if UNITS.assoc(bu.to_sym)
      multiplier = p.blank? ? 1 : BASE.rassoc(p.to_sym).first
      self.class.class_eval do
        define_method sym do
          @metric = Metric.new(self * multiplier, [ sym.to_sym, self ])
        end
        send(:alias_method,sym.to_s.pluralize.to_sym, sym)
      end
      return send sym
    end

    # Define to conversion
    # 1.lb.to_oz => 16
#    if sym.to_s =~ /to_(.*)/
#      raise UndefinedUnitError unless BASE.keys.include? $1.to_sym
#
#      self.class.class_eval do
#        define_method sym do
#          to_unit = $1.to_sym
#
#          if to_unit.eql? base.unit
#            return base 
#          end
#
#          a_dup = base.to_f/1.send(to_unit).base
#
#          unless base.unit.eql? 1.send(to_unit).base.unit
#            a_dup = a_dup / CONVERMetricON[[base.unit, 1.send(to_unit).base.unit]]
#          end
#
#          a_dup.send(to_unit)
#          a_dup
#
#        end
#      end
#      return send(sym)
#      #return base? ? send(sym) : base.send(sym)
#    end

    super
  end

  class Metric
    include Base
  end
end
