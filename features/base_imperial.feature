Feature: Foot Base
In order to calculate between feet
As a user
I can define each size of foot in a unit of inches

Scenario: Find inch in inches
Given that I have "1 in"
When I send message "unit"
Then I should have "in"
When I send message "base_unit"
Then I should have "in"
When I send message "value"
Then I should have 1
When I send message "long"
Then it should write "1 inches"

Scenario: Find foot in inches
Given that I have "1 ft"
When I send message "unit"
Then I should have "ft"
When I send message "base_unit"
Then I should have "in"
When I send message "value"
Then I should have 12
When I send message "long"
Then it should write "1 foots"

Scenario: Find yard in inches
Given that I have "1 yd"
When I send message "base_unit"
Then I should have "in"
When I send message "unit"
Then I should have "yd"
When I send message "value"
Then I should have 36
When I send message "long"
Then it should write "1 yards"

Scenario: Find mile in inches
Given that I have "1 mi"
When I send message "base_unit"
Then I should have "in"
When I send message "unit"
Then I should have "mi"
When I send message "value"
Then I should have 63360
When I send message "long"
Then it should write "1 miles"

