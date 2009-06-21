Feature: Gram Math
In order to calculate between grams
As a user
I can add, subtract, multiply and devide between gram measurements

Scenario: 1 kg + 2 kg
Given that I have "1 kg"
When I add it to "2 kg"
Then the sum should be "3.0 kg"

Scenario: 1 g + 100
Given that I have "1 g"
When I add it to 100
Then the sum should be "101 g"

Scenario: 1 kg + 1 g
Given that I have "1 kg"
When I add it to "1 g"
Then the sum should be "1.001 kg"

Scenario: 1 mg + 1 g
Given that I have "1 mg"
When I add it to "1 g"
Then the sum should be "1001.0 mg"
