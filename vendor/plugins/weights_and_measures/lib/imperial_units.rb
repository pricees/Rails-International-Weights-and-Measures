module ImperialUnits

  UNITS = [
    [ :in, 'inch' ],
    [ :ft, 'foot' ],
    [ :yd, 'yard' ],
    [ :mi, 'mile' ],
  ]

  BASE = [
    [ :in, :in ],
    [ :ft, :in ],
    [ :yd, :in ],
    [ :mi, :in ],
  ]


  def in
    @metric = Metric.new(self, [ :in, self ])
  end

  def ft
    @metric = Metric.new(self * 12.in.value, [ :ft, self ])
  end

  def yd 
    @metric = Metric.new(self * 3.ft.value, [ :yd, self ])
  end

  def mi
    @metric = Metric.new(self * 1760.yd.value, [ :mi, self ])
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

    def base_unit
      BASE.assoc(unit).try(:last)
    end

    def unit; @unit ||= @parts.first; end
    def face_value; @face_value ||= @parts.last; end
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

