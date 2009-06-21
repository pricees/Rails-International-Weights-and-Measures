Feature: Grams Base
In order to calculate between grams
As a user
I can define each size of gram in a unit of milligrams

Scenario: Find dam's unit
Given that I have "1 dam"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 10.0
When I send message "long"
Then it should write "1 decametres"

Scenario: Find hm's unit
Given that I have "1 hm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 100.0
When I send message "long"
Then it should write "1 hectometres"

Scenario: Find km's unit
Given that I have "1 km"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1000.0
When I send message "long"
Then it should write "1 kilometres"

Scenario: Find Mm's unit
Given that I have "1 Mm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1000000.0
When I send message "long"
Then it should write "1 megametres"

Scenario: Find Gm's unit
Given that I have "1 Gm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1000000000.0
When I send message "long"
Then it should write "1 gigametres"

Scenario: Find Tm's unit
Given that I have "1 Tm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1000000000000.0
When I send message "long"
Then it should write "1 terametres"

Scenario: Find Pm's unit
Given that I have "1 Pm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e+15
When I send message "long"
Then it should write "1 petametres"

Scenario: Find Em's unit
Given that I have "1 Em"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e+18
When I send message "long"
Then it should write "1 exametres"

Scenario: Find Zm's unit
Given that I have "1 Zm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e+21
When I send message "long"
Then it should write "1 zettametres"

Scenario: Find Ym's unit
Given that I have "1 Ym"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e+24
When I send message "long"
Then it should write "1 yottametres"

Scenario: Find dm's unit
Given that I have "1 dm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 0.1
When I send message "long"
Then it should write "1 decimetres"

Scenario: Find cm's unit
Given that I have "1 cm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 0.01
When I send message "long"
Then it should write "1 centimetres"

Scenario: Find mm's unit
Given that I have "1 mm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 0.001
When I send message "long"
Then it should write "1 millimetres"

Scenario: Find mcm's unit
Given that I have "1 mcm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-06
When I send message "long"
Then it should write "1 micrometres"

Scenario: Find nm's unit
Given that I have "1 nm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-09
When I send message "long"
Then it should write "1 nanometres"

Scenario: Find pm's unit
Given that I have "1 pm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-12
When I send message "long"
Then it should write "1 picometres"

Scenario: Find fm's unit
Given that I have "1 fm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-15
When I send message "long"
Then it should write "1 femtometres"

Scenario: Find am's unit
Given that I have "1 am"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-18
When I send message "long"
Then it should write "1 attometres"

Scenario: Find zm's unit
Given that I have "1 zm"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-21
When I send message "long"
Then it should write "1 zeptometres"

Scenario: Find ym's unit
Given that I have "1 ym"
When I send message "base_unit"
Then I should have "m"
When I send message "value"
Then I should have 1.0e-24
When I send message "long"
Then it should write "1 yoctometres"
