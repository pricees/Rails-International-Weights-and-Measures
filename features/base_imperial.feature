Feature: Imperial Base
In order to calculate between Imperial lengths
As a user
I can define each size of length in a unit of inches

Scenario: Find inch in ft
Given that I have "1 in"
When I send message "unit"
Then I should have "in"
When I send message "base_unit"
Then I should have "ft"
When I send message "value"
Then I should have 0.083333 
When I send message "long"
Then it should write "1 inches"

Scenario: Find foot in feet
Given that I have "1 ft"
When I send message "unit"
Then I should have "ft"
When I send message "base_unit"
Then I should have "ft"
When I send message "value"
Then I should have 1
When I send message "long"
Then it should write "1 foots"

Scenario: Find yard in ft
Given that I have "1 yd"
When I send message "base_unit"
Then I should have "ft"
When I send message "unit"
Then I should have "yd"
When I send message "value"
Then I should have 3
When I send message "long"
Then it should write "1 yards"

Scenario: Find mile in ft
Given that I have "1 mi"
When I send message "base_unit"
Then I should have "ft"
When I send message "unit"
Then I should have "mi"
When I send message "value"
Then I should have 5280
When I send message "long"
Then it should write "1 miles"

