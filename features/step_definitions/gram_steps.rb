Given /^that I have "([^\"]*)"$/ do |arg1|
  num, unit = arg1.split
  num = (num =~ /\./) ? num.to_f : num.to_i
  @i = num.send(unit.to_sym)
end

When /^I send message "([^\"]*)"$/ do |message|
  @res = @i.send(message.to_sym)
end

Then /^I should have "([^\"]*)"$/ do |arg1|
  num, unit = arg1.split
  num = (num =~ /\./) ? num.to_f : num.to_i #set to float or int
  @res.should ==num
  @res.unit.should ==unit.to_sym
end

Then /^it should write "([^\"]*)"$/ do |arg1|
  @res.tos.should ==arg1
end

