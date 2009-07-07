# WeightsAndMeasures
module WeightsAndMeasures
  include StandardUnits
  include ImperialUnits
  class UndefinedUnitError < StandardError;end 

    # Define to conversion
    # 1.lb.to_oz => 16
#    if sym.to_s =~ /to_(.*)/
#      raise UndefinedUnitError unless StandardUnits::BASE.keys.include? $1.to_sym
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
end
