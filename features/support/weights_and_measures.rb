#
# to_numeric("1") == 1
# to_numeric("1.5") == 1.5
#
def to_numeric(num)
  num = num.to_s
  num = (num =~ /\./) ? sprintf("%.5f", num).to_f : num.to_i
end
#
# to_metric("1 kg") == 1.kg
# to_metric("1.5 kg") == 1.5 kg
#
def to_metric(str)
  num, unit = str.split
  to_numeric(num).send(unit.to_sym)
end
