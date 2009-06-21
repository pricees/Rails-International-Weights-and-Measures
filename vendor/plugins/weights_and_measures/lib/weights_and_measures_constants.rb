module WeightsAndMeasuresConstants
  UNITS = [
    [ :g, 'gram' ],
    [ :m, 'metre' ]
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
end
