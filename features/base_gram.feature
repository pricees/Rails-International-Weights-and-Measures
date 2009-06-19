Feature: Grams Base
In order to calculate between grams
As a user
I can define each size of gram in a unit of milligrams

Scenario: Find kg's unit
Given that I have "1 kg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1000.0
When I send message "long"
Then it should write "1 kilograms"

Scenario: Find kg's unit
Given that I have "1 dg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 0.1
When I send message "long"
Then it should write "1 decigrams"

