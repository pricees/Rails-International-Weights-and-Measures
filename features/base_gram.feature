Feature: Grams Base
In order to calculate between grams
As a user
I can define each size of gram in a base of milligrams

Scenario: Find kg's base
Given that I have "1 kg"
When I send message "base"
Then I should have "1000000.0 mg"
And it should write "1000000.0 milligrams"


Scenario: Find hg's base
Given that I have "1 hg"
When I send message "base"
Then I should have "100000.0 mg"
And it should write "100000.0 milligrams"


Scenario: Find dg's base
Given that I have "1 dg"
When I send message "base"
Then I should have "10000.0 mg"
And it should write "10000.0 milligrams"


Scenario: Find g's base
Given that I have "1 g"
When I send message "base"
Then I should have "1000.0 mg"
And it should write "1000.0 milligrams"


Scenario: Find cg's base
Given that I have "1 cg"
When I send message "base"
Then I should have "10.0 mg"
And it should write "10.0 milligrams"


Scenario: Find mg's base
Given that I have "1 mg"
When I send message "base"
Then I should have "1.0 mg"
And it should write "1.0 milligrams"

