module ImperialUnits

  UNITS = [
    [ :in, 'inch' ],
    [ :ft, 'foot' ],
    [ :yd, 'yard' ],
    [ :mi, 'mile' ],
    [ :fur, 'furlong' ],
  ]

  BASE = [
    [ :in, :in ],
    [ :ft, :in ],
    [ :yd, :in ],
    [ :mi, :in ],
    [ :R, :in ], 
    [ :fur, :in],
  ]


  def in
    Metric.new(self, [ :in, self ])
  end

  def ft
    Metric.new(self * 12.in.value, [ :ft, self ])
  end

  def link
    Metric.new(self * 0.66.ft.value, [ :link, self ])
  end
  alias_method :R, :link
  alias_method :perch, :link

  def pole
    Metric.new(self * 25.link.value, [ :pole, self ])
  end

  def chain
    Metric.new(self * 4.pole.value, [ :pole, self ])
  end

  def yd 
    Metric.new(self * 3.ft.value, [ :yd, self ])
  end

  def fathom
    Metric.new(self * 6.ft.value, [ :fathom, self ])  #Adopted in 1970, before that it was 6.08ft (1/1000 of a naut mi)
  end

  def cable
    Metric.new(self * 608.ft.value, [ :cables, self ]) #100 pre-1970 fathoms
  end

  def nautical_mile
    Metric.new(self * 10.cable.value, [ :nautical_mile, self ])
  end

  def fur
    Metric.new(self * 220.yd.value, [ :fur, self ])
  end

  def mi
    Metric.new(self * 1760.yd.value, [ :mi, self ])
  end

  def league
    Metric.new(self * 3.my.value, [ :league, self ])
  end

  def +(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value + other.value), [ unit, face_value + other.face_value ])
    end
    Metric.new((value + other.value), [ unit, face_value + (other.value/(value.to_f/face_value)) ])
  end

  def -(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value - other.value), [ unit, face_value - other.face_value ])
    end
  end

  def *(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value * other.value), [ unit, face_value * other.face_value ])
    end
  end

  def *(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value * other.value), [ unit, face_value * other.face_value ])
    end
  end

  def /(other)
    other = metricize(other,unit) unless other.is_a?Metric
    if unit == other.unit
      return Metric.new((value / other.value), [ unit, face_value / other.face_value ])
    end
  end

  class Metric
    include ImperialUnits

    attr_reader :value, :parts

    def unit; @parts.first; end
    def base_unit; BASE.assoc(unit).try(:last); end
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

