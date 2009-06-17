Feature: Gram 
In order to calculate between gram weights
As a user
I can define weights in grams

Scenario: Find kg and grams
Given that I have "1 kg"
When I send message "to_mg"
Then I should have "1000000.0 mg"
And it should write "1000000.0 milligrams"

Scenario: Find mg from 1oz
Given that I have "1 oz"
When I send message "to_mg"
Then I should have "28349.5231 mg"
And it should write "28349.5231 milligrams"
