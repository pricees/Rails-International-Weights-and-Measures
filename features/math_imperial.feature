Feature: Gram Math
In order to calculate between grams
As a user
I can add, subtract, multiply and devide between gram measurements

Scenario: 1 ft + 2 ft
Given that I have "1 ft"
When I add it to "2 ft"
Then the sum should be "3 ft"

Scenario: 1 ft + 100
Given that I have "1 ft"
When I add it to 100
Then the sum should be "101 ft"

Scenario: 1 ft + 6 in
Given that I have "1 ft"
When I add it to "6 in"
Then the sum should be "1.5 ft"

Scenario: 1 in + 1 ft
Given that I have "1 in"
When I add it to "1 ft"
Then the sum should be "13.0 in"

Scenario: 1.5 yd + 1.5 ft
Given that I have "1.5 yd"
When I add it to "1.5 ft"
Then the sum should be "2.0 yd"

Scenario: 2 ft * 1 yd
Given that I have "2 ft"
When I multiply it by "1 yd"
Then the product should be "6.0 ft"

Scenario: 3 ft / 2 yd
Given that I have "3 ft"
When I divide it by "2 yd"
Then the quotient should be "0.5 ft"

Scenario: 2 in - 3 furs
Given that I have "2 in"
When I subtract from it "3 furlongs"
Then the sum should be "-23758.0 in"
