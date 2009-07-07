module ImperialUnits

  UNITS = [
    [ :in, 'inch' ],
    [ :ft, 'foot' ],
    [ :yd, 'yard' ],
    [ :mi, 'mile' ],
    [ :fur, 'furlong' ],
    [ :link, 'link ' ],
    [ :pole, 'pole' ],
    [ :chain, 'chain' ],
    [ :fathom, 'fathom' ],
    [ :cable, 'cable' ],
    [ :naut, 'nautical mile' ],
    [ :league, 'league' ],
    [ :grain, 'grains' ],
    [ :drachm, 'drachm' ],
    [ :oz, 'ounce' ],
    [ :lb, 'pound' ],
    [ :st , 'stone' ],
    [ :quarter, 'quarter' ],
    [ :cwt, 'hundredweight' ],
    [ :t, 'ton' ],
  ]

  BASE = [
    [ :in, :ft ],
    [ :ft, :ft ],
    [ :yd, :ft ],
    [ :mi, :ft ],
    [ :R, :ft ], 
    [ :fur, :ft],
    [ :link, :ft ],
    [ :pole, :ft ],
    [ :chain, :ft ],
    [ :fathom, :ft ],
    [ :cable, :ft ],
    [ :naut, :ft ],
    [ :league, :ft ],
    [ :grain, :lb ],
    [ :drachm, :lb ],
    [ :oz, :lb ],
    [ :lb, :lb ],
    [ :st , :lb ],
    [ :quarter, :lb ],
    [ :cwt, :lb ],
    [ :t, :lb ],
  ]

  # Mass 

  def grain
    Metric.new(self * (1.lb/7000.0).value, [ :grain, self ])
  end
  %w(grains).each { |m| alias_method m.to_sym, :grain }

  def drachm 
    Metric.new(self * (1.lb/256.0).value, [ :drachm, self ])
  end
  %w(drachms).each { |m| alias_method m.to_sym, :drachm }

  def oz
    Metric.new(self * (1.lb/16.0).value, [ :oz, self ])
  end
  %w(ounce ounces).each { |m| alias_method m.to_sym, :oz }

  def lb
    Metric.new(self, [ :lb, self ])
  end
  %w(lbs pound pounds).each { |m| alias_method m.to_sym, :lb }

  def st
    Metric.new(self * 14.lb.value, [ :st, self ])
  end
  %w(stone stones).each { |m| alias_method m.to_sym, :st }

  def quarter
    Metric.new(self * 2.st.value, [ :quarter, self ])
  end
  %w(quarters).each { |m| alias_method m.to_sym, :quarter }

  def cwt
    Metric.new(self * 4.quarters.value, [ :cwt, self ])
  end
  %w(hundredweight hundredweights).each { |m| alias_method m.to_sym, :cwt}

  def t
    Metric.new(self * 20.cwt.value, [ :t, self ])
  end
  %w(ton tons).each { |m| alias_method m.to_sym, :t}

  # Length 
  def in
    Metric.new(self * (1.0/12).ft.value, [ :in, self ])
  end
  %w(inch inches).each { |m| alias_method m.to_sym, :in }

  def ft
    Metric.new(self, [ :ft, self ])
  end
  %w(foot feet).each { |m| alias_method m.to_sym, :ft }

  def link
    Metric.new(self * 0.66.ft.value, [ :link, self ])
  end
  %w(R perch).each { |m| alias_method m.to_sym, :link }

  def pole
    Metric.new(self * 25.link.value, [ :pole, self ])
  end

  def chain
    Metric.new(self * 4.pole.value, [ :pole, self ])
  end

  def yd 
    Metric.new(self * 3.ft.value, [ :yd, self ])
  end
  %w(yard yards).each { |m| alias_method m.to_sym, :yd }

  def fathom
    Metric.new(self * 6.ft.value, [ :fathom, self ])  #Adopted in 1970, before that it was 6.08ft (1/1000 of a naut mi)
  end
  %w(fth  fthm fathoms).each { |m| alias_method m.to_sym, :fathom }

  def cable
    Metric.new(self * 608.ft.value, [ :cables, self ]) #100 pre-1970 fathoms
  end

  def naut
    Metric.new(self * 10.cable.value, [ :nautical_mile, self ])
  end
  %w(nautical_mi nautical_mile nautical_miles).each { |m| alias_method m.to_sym, :naut }

  def fur
    Metric.new(self * 220.yd.value, [ :fur, self ])
  end
  [ :furs, :furlong, :furlongs ].each { |m| alias_method m, :fur }

  def mi
    Metric.new(self * 1760.yd.value, [ :mi, self ])
  end
  %w(miles mile).each { |m| alias_method m.to_sym, :mi }

  def league
    Metric.new(self * 3.my.value, [ :league, self ])
  end

  # Math functions

  def +(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value + other.value), [ unit, face_value + other.face_value ])
    end

    Metric.new(value + other.value, [ unit, face_value + base_val(other) ])
  end

  def -(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value - other.value), [ unit, face_value - other.face_value ])
    end

    Metric.new(value - other.value, [ unit, face_value - base_val(other) ])
  end

  def *(other)
    other = metricize(other,unit) unless other.is_a?Metric

    if unit == other.unit
      return Metric.new((value * base_val(other)), [ unit, face_value * other.face_value ])
    end

    Metric.new((value * base_val(other)), [ unit, face_value * base_val(other) ])
  end

  def /(other)
    other = metricize(other,unit) unless other.is_a?Metric

    if unit == other.unit
      return Metric.new((value / base_val(other)), [ unit, face_value / other.face_value ])
    end

    Metric.new((value / base_val(other)), [ unit, face_value / base_val(other) ])

  end

  def base_val(other)
    @unit_val ||= 1.send(unit).value
    other.value.to_f/@unit_val
  end

  class Metric
    include ImperialUnits

    attr_reader :value, :parts

    def unit; @parts.first; end
    def base_unit; BASE.assoc(unit).try(:last); end
    def base_value; BASE.assoc(unit).try(:last); end
    def face_value; @parts.last; end
    def long; to_s(:long); end
    def to_param; @value; end

    def initialize(value, parts)
      @value, @parts = value, parts
    end

    def to_s(type = nil)
      s = "#{face_value}" 
      s << " #{unit}" if type.nil?
      s << " #{ImperialUnits::UNITS.assoc(unit).try(:last).try(:pluralize)}" if type.eql?:long
      s
    end
  end

  protected

  def metricize(num,unit)
    Metric.new(num, [ unit, num ])
  end

end

