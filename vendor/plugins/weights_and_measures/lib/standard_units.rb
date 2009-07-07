module StandardUnits
  UNITS = [
    [ :g, 'gram' ],
    [ :m, 'metre' ],
  ]

  MULTIPLE_NAMES = [
    [ :da, :deca ],
    [ :h, :hecto ],
    [ :k, :kilo ],
    [ :M, :mega ],
    [ :G, :giga ],
    [ :T, :tera ],
    [ :P, :peta ],
    [ :E, :exa ],
    [ :Z, :zetta ],
    [ :Y, :yotta ],
    [ :d, :deci ],
    [ :c, :centi ],
    [ :m, :milli ],
    [ :mc, :micro ],
    [ :n, :nano ],
    [ :p, :pico ],
    [ :f, :femto ],
    [ :a, :atto ],
    [ :z, :zepto ],
    [ :y, :yocto ],
    [ '', nil ]
  ]

  BASE = [
    [ 1e1, :da ],
    [ 1e2, :h ],
    [ 1e3, :k ],
    [ 1e6, :M ],
    [ 1e9, :G ],
    [ 1e12, :T ],
    [ 1e15, :P ],
    [ 1e18, :E ],
    [ 1e21, :Z ],
    [ 1, nil ],
    [ 1, '' ],
    [ 1e24, :Y ],
    [ 1e-1, :d ],
    [ 1e-2, :c ],
    [ 1e-3, :m ],
    [ 1e-6, :mc ],
    [ 1e-9, :n ],
    [ 1e-12, :p ],
    [ 1e-15, :f ],
    [ 1e-18, :a ],
    [ 1e-21, :z ],
    [ 1e-24, :y ]
  ]

    def base_unit
      res = unit.to_s[-1,1]
      @base_unit = res.blank? ? res : res.to_sym
    end

    def prefix
      res = unit.to_s[0, unit.to_s.length-1]
      @prefix = res.blank? ? res : res.to_sym
    end
  
    def +(other)
      other = metricize(other,unit) unless other.is_a?Metric
      Metric.new(value + other.value, [ unit, ((value + other.value)/ StandardUnits::BASE.rassoc(prefix).first) ])
    end

    def -(other)
      other = metricize(other,unit) unless other.is_a?Metric
      Metric.new(value - other.value, [ unit, ((value - other.value)/ StandardUnits::BASE.rassoc(prefix).first) ])
    end

    def *(other)
      other = metricize(other,unit) unless other.is_a?Metric
      if unit == other.unit
        return Metric.new(((value * other.value) / StandardUnits::BASE.rassoc(prefix).first), [ unit, face_value * other.face_value ])
      end
      Metric.new(value * other.value, [ unit, ((value * other.value)/ StandardUnits::BASE.rassoc(prefix).first) ])
    end

    def /(other)
      other = metricize(other,unit) unless other.is_a?Metric
      if unit == other.unit
        return Metric.new(((value.to_f / other.value) / StandardUnits::BASE.rassoc(prefix).first), [ unit, face_value.to_f / other.face_value ])
      end
      Metric.new(value.to_f / other.value, [ unit, ((value.to_f / other.value)/ StandardUnits::BASE.rassoc(prefix).first) ])
    end

    def to_s(type = nil)
      s = "#{face_value}" 
      s << " #{unit}" if type.nil?
      s << " #{StandardUnits::MULTIPLE_NAMES.assoc(prefix).try(:last)}#{StandardUnits::UNITS.assoc(base_unit).last.pluralize}" if type.eql?:long
      s
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
    if StandardUnits::UNITS.assoc(bu.to_sym)
      multiplier = p.blank? ? 1 : StandardUnits::BASE.rassoc(p.to_sym).first
      self.class.class_eval do
        define_method sym do
          Metric.new(self * multiplier, [ sym.to_sym, self ])
        end
        send(:alias_method,sym.to_s.pluralize.to_sym, sym)
      end
      return send sym
    end

    super
  end

  class Metric
    include StandardUnits

    attr_reader :value, :parts

    def unit; @parts.first; end
    def face_value; @parts.last; end
    def long; to_s(:long); end
    def to_param; @value; end

    def initialize(value, parts)
      @value, @parts = value, parts
    end

  end

  protected
  def metricize(num,unit)
      Metric.new(num * StandardUnits::BASE.rassoc(prefix).first, [ unit, num ])
  end
end
