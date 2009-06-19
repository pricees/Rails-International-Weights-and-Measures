Given /^that I have "([^\"]*)"$/ do |arg1|
  num, unit = arg1.split
  num = (num =~ /\./) ? num.to_f : num.to_i
  @i = num.send(unit.to_sym)
end

When /^I send message "([^\"]*)"$/ do |message|
  @res = @i.send(message)
end

Then /^I should have "([^\"]*)"$/ do |arg1|
  @res.should ==arg1
end

Then /^I should have :([^\"]*)$/ do |arg1|
  @res.should ==arg1.to_sym
end

Then /^I should have ([^\"]*)$/ do |arg1|
  @res.should ==arg1.to_f
end

Then /^it should write "([^\"]*)"$/ do |arg1|
  @res.to_s.should ==arg1
end

