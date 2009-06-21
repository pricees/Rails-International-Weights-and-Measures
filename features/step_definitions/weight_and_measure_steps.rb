Given /^that I have "([^\"]*)"$/ do |arg1|
  @num_1 = to_metric(arg1)
end

When /^I send message "([^\"]*)"$/ do |message|
  @res = @num_1.send(message)
end

Then /^I should have "([^\"]*)"$/ do |arg1|
  @res.to_s.should ==arg1
end

Then /^I should have :([^\"]*)$/ do |arg1|
  @res.should ==arg1.to_sym
end

Then /^I should have ([^\"]*)$/ do |arg1|
  @res.should ==to_numeric(arg1)
end

Then /^it should write "([^\"]*)"$/ do |arg1|
  @res.to_s.should ==arg1
end

When /^I add it to ([^\"]*)$/ do |arg1|
  @res = @num_1 + to_numeric(arg1)
end

When /^I add it to "([^\"]*)"$/ do |arg1|
  @res = @num_1 + to_metric(arg1)
end

Then /^the sum should be "([^\"]*)"$/ do |arg1|
  @res.to_s.should ==arg1
end

