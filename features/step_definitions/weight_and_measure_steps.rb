Given /^that I have "([^\"]*)"$/ do |arg1|
  @num = to_metric(arg1)
end

#######################
# Message / Response
#######################

When /^I send message "([^\"]*)"$/ do |message|
  @res = @num.send(message)
end

Then /^I should have "([^\"]*)"$/ do |arg1|
  @res.to_s.should ==arg1
end

Then /^I should have :([^\"]*)$/ do |arg1|
  @res.should ==arg1.to_sym
end

Then /^I should have ([^\"]*)$/ do |arg1|
  to_numeric(@res).should ==to_numeric(arg1)
end

Then /^it should write "([^\"]*)"$/ do |arg1|
  @res.to_s.should ==arg1
end

#######################
# Addition
#######################

When /^I add it to ([^\"]*)$/ do |arg1|
  @num = @num + to_numeric(arg1)
end

When /^I add it to "([^\"]*)"$/ do |arg1|
  @num = @num + to_metric(arg1)
end

Then /^the sum should be "([^\"]*)"$/ do |arg1|
  @num.to_s.should ==arg1
end

#######################
# Subtraction
#######################

When /^I subtract from it ([^\"]*)$/ do |arg1|
  @num = @num - to_numeric(arg1)
end

When /^I subtract from it "([^\"]*)"$/ do |arg1|
  @num = @num - to_metric(arg1)
end

Then /^the difference should be "([^\"]*)"$/ do |arg1|
  @num.to_s.should ==arg1
end

#######################
# Multiplication
#######################

When /^I multiply it by ([^\"]*)$/ do |arg1|
  @num = @num * to_numeric(arg1)
end

When /^I multiply it by "([^\"]*)"$/ do |arg1|
  @num = @num * to_metric(arg1)
end

Then /^the product should be "([^\"]*)"$/ do |arg1|
  @num.to_s.should ==arg1
end

#######################
# Division
#######################

When /^I divide it by "([^\"]*)"$/ do |arg1|
  @num = @num / to_metric(arg1)
end

When /^I divide it by ([^\"]*)$/ do |arg1|
  @num = @num / to_numeric(arg1)
end

Then /^the quotient should be "([^\"]*)"$/ do |arg1|
  @num.to_s.should ==arg1
end
