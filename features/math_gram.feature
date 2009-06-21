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

Scenario: 2 mg + 4 kg
Given that I have "2 mg"
When I add it to "4 kg"
Then the sum should be "4000002.0 mg"

Scenario: 1 kg - 2 kg
Given that I have "1 kg"
When I subtract from it "2 kg"
Then the difference should be "-1.0 kg"

Scenario: 1 g - 100
Given that I have "1 g"
When I subtract from it 100
Then the difference should be "-99 g"

Scenario: 1 kg - 1 g
Given that I have "1 kg"
When I subtract from it "1 g"
Then the difference should be "0.999 kg"

Scenario: 1000 mg - 1mg
Given that I have "1000 mg"
When I subtract from it "1 mg"
Then the difference should be "999.0 mg"

Scenario: 4 kg - 2 mg
Given that I have "4 kg"
When I subtract from it "2 mg"
Then the difference should be "3.999998 kg"

Scenario: 1 kg * 2 kg
Given that I have "1 kg"
When I multiply it by "2 kg"
Then the product should be "2 kg"

Scenario: 2 kg * 2 kg
Given that I have "2 kg"
When I multiply it by "2 kg"
Then the product should be "4 kg"

Scenario: 2 kg * 1 mg
Given that I have "2 kg"
When I multiply it by "1 mg"
Then the product should be "0.002 kg"

Scenario: 1 mg * 2 kg
Given that I have "2 mg"
When I multiply it by "1 kg"
Then the product should be "2000.0 mg"

Scenario: 2 mg * 100
Given that I have "2 mg"
When I multiply it by 100
Then the product should be "200 mg"

Scenario: 10 kg * 23
Given that I have "10 kg"
When I multiply it by 23
Then the product should be "230 kg"

Scenario: 15 kg + 3 kg * 200
Given that I have "3 kg"
When I multiply it by 200
And I add it to "15 kg"
Then the sum should be "615.0 kg"

Scenario: 1 cg * 0.5
Given that I have "1 cg"
When I multiply it by 0.5
Then the product should be "0.5 cg"

Scenario: 23 mg * 20 hg 
Given that I have "23 mg"
When I multiply it by "20 hg"
Then the product should be "46000.0 mg"

Scenario: 2 kg / 1 kg
Given that I have "2 kg"
When I divide it by "1 kg"
Then the quotient should be "2.0 kg"

Scenario: 1 kg / 2 kg
Given that I have "1 kg"
When I divide it by "2 kg"
Then the quotient should be "0.5 kg"

Scenario: 1 g / 2 mg
Given that I have "1 g"
When I divide it by "2 mg"
Then the quotient should be "500.0 g"

Scenario: 1 g / 1 mg
Given that I have "1 g"
When I divide it by "1 mg"
Then the quotient should be "1000.0 g"
