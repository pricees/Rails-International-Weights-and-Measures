# WeightsAndMeasures
module WeightsAndMeasures
  attr_accessor :unit
  attr_writer :val
  class UndefinedUnitError < StandardError;end 
  class Weight
    attr_reader :value, :parts

    def initialize(value, parts)
      @value, @parts = value, parts
    end

    def to_s
      puts "#{@parts.last} #{@parts.first}"
    end

    def -(other)
      Weight.new(@value - other.value, [ @parts.first, @parts.last - other.parts.last ])
    end

    def *(other)
      if other.parts.first == @parts.first
        Weight.new(@value * other.value, [ @parts.first, @parts.last * other.parts.last ])
      else
        Weight.new(@value * other.value, [ @parts.first, @parts.last * (other.parts.last * other.value/@value) ])
      end
    end

    def +(other)
      if other.parts.first == @parts.first
        Weight.new(@value + other.value, [ @parts.first, @parts.last + other.parts.last ])
      else
        Weight.new(@value + other.value, [ @parts.first, @parts.last + (other.parts.last * other.value/@value) ])
      end
    end
  end

  def kg
    @weight = Weight.new(self * 1E6, [ :kg, self ])
  end

  def hg
    @weight = Weight.new(self * 1E5, [ :hg, self ])
  end

  def dg
    @weight = Weight.new(self * 1E4, [ :dg, self ])
  end

  def g
    @weight = Weight.new(self * 10E3, [ :g, self ])
  end

  def cg
    @weight = Weight.new(self * 10E2, [ :cg, self ])
  end

  def mg
    @weight = Weight.new(self, [ :mg, self ])
  end

  STRING = {
    :ft => 'foot',
    :in => 'inch',
    :g => 'gram',
    :kg => 'kilogram',
    :km => 'kilometer',
    :mg => 'milligram',
    :lb => 'pound',
    :mm => 'millimeter',
    :oz => 'ounce',
    :hm => 'hectometer',
    :dm => 'decameter',
  }

# Covertions based off 1lb
  
  BASE = {
    #NOTE: meters
    :km => [ 1E6, :mm ],
    :hm => [ 1E5, :mm ],
    :dm => [ 1E4, :mm ],
    :m => [ 1E3, :mm ],
    :cm => [ 10, :mm ],
    :mm => [ 1, :mm ],

    #NOTE: grams
    :kg => [ 1E6, :mg ],
    :hg => [ 1E5, :mg ],
    :dg => [ 1E4, :mg ],
    :g => [ 1E3, :mg ],
    :cg => [ 10, :mg ],
    :mg => [ 1, :mg ],

    #Pound
    :lb => [ 16.0, :oz ],
    :oz => [ 1.0, :oz ],
    # Foot
    :ft => [ 12.0, :in ],
    :in => [ 1.0, :in ],

    #ton
    :ton => [ 2000*16.0, :oz]
  }

  CONVERSION = {
    [ :mm, :in ] => 25.4,
    [ :in, :mm ] => 25.4,
    [ :mg, :oz ] => 3.52739619*10E-5,
    [ :oz, :mg ] => 28349.5231,
  }

  def method_missing(sym, *args, &block)
    sym = sym.to_s.singularize.to_sym
    #
    # Define the measurement or weight
    # 1.lb
    # alias the pluralized form
    # 1.lbs => 1.lb
    if BASE.keys.include? sym
      self.class.class_eval do
        define_method sym do
          self.unit = sym
          self
        end
        send(:alias_method,sym.to_s.pluralize.to_sym, sym)
      end
      return send sym
    end

    # Define to conversion
    # 1.lb.to_oz => 16
    if sym.to_s =~ /to_(.*)/
      raise UndefinedUnitError unless BASE.keys.include? $1.to_sym

      self.class.class_eval do
        define_method sym do
          to_unit = $1.to_sym

          if to_unit.eql? base.unit
            return base 
          end

          a_dup = base.to_f/1.send(to_unit).base

          unless base.unit.eql? 1.send(to_unit).base.unit
            a_dup = a_dup / CONVERSION[[base.unit, 1.send(to_unit).base.unit]]
          end

          a_dup.send(to_unit)
          a_dup

        end
      end
      return send(sym)
      #return base? ? send(sym) : base.send(sym)
    end

    super
  end

  def base?
    unit && unit.eql?(BASE[unit].last)
  end

  def base
    return self if base?
    a_dup = self * BASE[unit].first
    a_dup.send(BASE[unit].last)
    a_dup
  end
  
  def +(another)
    puts self, another
  end

  def tos
    "#{self.to_f} #{STRING[unit].pluralize}"
  end

end
