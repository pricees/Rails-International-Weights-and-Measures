Feature: Meters Base
In order to calculate between meters
As a user
I can define each size of meter in a base of millimeters

Scenario: Find km's base
Given that I have "1 km"
When I send message "base"
Then I should have "1000000.0 mm"
And it should write "1000000.0 millimeters"


Scenario: Find hm's base
Given that I have "1 hm"
When I send message "base"
Then I should have "100000.0 mm"
And it should write "100000.0 millimeters"


Scenario: Find dm's base
Given that I have "1 dm"
When I send message "base"
Then I should have "10000.0 mm"
And it should write "10000.0 millimeters"


Scenario: Find m's base
Given that I have "1 m"
When I send message "base"
Then I should have "1000.0 mm"
And it should write "1000.0 millimeters"


Scenario: Find cm's base
Given that I have "1 cm"
When I send message "base"
Then I should have "10.0 mm"
And it should write "10.0 millimeters"


Scenario: Find mm's base
Given that I have "1 mm"
When I send message "base"
Then I should have "1.0 mm"
And it should write "1.0 millimeters"

