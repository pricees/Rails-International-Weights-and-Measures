Feature: Gram Math
In order to calculate between grams
As a user
I can add, subtract, multiply and devide between gram measurements

Scenario: 1 km + 2 km
Given that I have "1 km"
When I add it to "2 km"
Then the sum should be "3.0 km"

Scenario: 1 m + 100
Given that I have "1 m"
When I add it to 100
Then the sum should be "101 m"

Scenario: 1 km + 1 m
Given that I have "1 km"
When I add it to "1 m"
Then the sum should be "1.001 km"

Scenario: 1 mm + 1 m
Given that I have "1 mm"
When I add it to "1 m"
Then the sum should be "1001.0 mm"

Scenario: 2 mm + 4 km
Given that I have "2 mm"
When I add it to "4 km"
Then the sum should be "4000002.0 mm"

Scenario: 1 km - 2 km
Given that I have "1 km"
When I subtract from it "2 km"
Then the difference should be "-1.0 km"

Scenario: 1 m - 100
Given that I have "1 m"
When I subtract from it 100
Then the difference should be "-99 m"

Scenario: 1 km - 1 m
Given that I have "1 km"
When I subtract from it "1 m"
Then the difference should be "0.999 km"

Scenario: 1000 mm - 1mm
Given that I have "1000 mm"
When I subtract from it "1 mm"
Then the difference should be "999.0 mm"

Scenario: 4 km - 2 mm
Given that I have "4 km"
When I subtract from it "2 mm"
Then the difference should be "3.999998 km"

Scenario: 1 km * 2 km
Given that I have "1 km"
When I multiply it by "2 km"
Then the product should be "2 km"

Scenario: 2 km * 2 km
Given that I have "2 km"
When I multiply it by "2 km"
Then the product should be "4 km"

Scenario: 2 km * 1 mm
Given that I have "2 km"
When I multiply it by "1 mm"
Then the product should be "0.002 km"

Scenario: 1 mm * 2 km
Given that I have "2 mm"
When I multiply it by "1 km"
Then the product should be "2000.0 mm"

Scenario: 2 mm * 100
Given that I have "2 mm"
When I multiply it by 100
Then the product should be "200 mm"

Scenario: 10 km * 23
Given that I have "10 km"
When I multiply it by 23
Then the product should be "230 km"

Scenario: 1 cm * 0.5
Given that I have "1 cm"
When I multiply it by 0.5
Then the product should be "0.5 cm"

Scenario: 23 mm * 20 hg 
Given that I have "23 mm"
When I multiply it by "20 hm"
Then the product should be "46000.0 mm"

Scenario: 2 km / 1 km
Given that I have "2 km"
When I divide it by "1 km"
Then the quotient should be "2.0 km"

Scenario: 1 km / 2 km
Given that I have "1 km"
When I divide it by "2 km"
Then the quotient should be "0.5 km"

Scenario: 1 m / 2 mm
Given that I have "1 m"
When I divide it by "2 mm"
Then the quotient should be "500.0 m"

Scenario: 1 m / 1 mm
Given that I have "1 m"
When I divide it by "1 mm"
Then the quotient should be "1000.0 m"
