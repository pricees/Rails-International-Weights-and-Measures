Feature: Grams Base
In order to calculate between grams
As a user
I can define each size of gram in a unit of milligrams

Scenario: Find dag's unit
Given that I have "1 dag"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 10.0
When I send message "long"
Then it should write "1 decagrams"

Scenario: Find hg's unit
Given that I have "1 hg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 100.0
When I send message "long"
Then it should write "1 hectograms"

Scenario: Find kg's unit
Given that I have "1 kg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1000.0
When I send message "long"
Then it should write "1 kilograms"

Scenario: Find Mg's unit
Given that I have "1 Mg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1000000.0
When I send message "long"
Then it should write "1 megagrams"

Scenario: Find g's unit
Given that I have "1 g"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0
When I send message "long"
Then it should write "1 grams"

Scenario: Find Gg's unit
Given that I have "1 Gg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1000000000.0
When I send message "long"
Then it should write "1 gigagrams"

Scenario: Find Tg's unit
Given that I have "1 Tg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1000000000000.0
When I send message "long"
Then it should write "1 teragrams"

Scenario: Find Pg's unit
Given that I have "1 Pg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e+15
When I send message "long"
Then it should write "1 petagrams"

Scenario: Find Eg's unit
Given that I have "1 Eg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e+18
When I send message "long"
Then it should write "1 exagrams"

Scenario: Find Zg's unit
Given that I have "1 Zg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e+21
When I send message "long"
Then it should write "1 zettagrams"

Scenario: Find Yg's unit
Given that I have "1 Yg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e+24
When I send message "long"
Then it should write "1 yottagrams"

Scenario: Find dg's unit
Given that I have "1 dg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 0.1
When I send message "long"
Then it should write "1 decigrams"

Scenario: Find cg's unit
Given that I have "1 cg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 0.01
When I send message "long"
Then it should write "1 centigrams"

Scenario: Find mg's unit
Given that I have "1 mg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 0.001
When I send message "long"
Then it should write "1 milligrams"

Scenario: Find mcg's unit
Given that I have "1 mcg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-06
When I send message "long"
Then it should write "1 micrograms"

Scenario: Find ng's unit
Given that I have "1 ng"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-09
When I send message "long"
Then it should write "1 nanograms"

Scenario: Find pg's unit
Given that I have "1 pg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-12
When I send message "long"
Then it should write "1 picograms"

Scenario: Find fg's unit
Given that I have "1 fg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-15
When I send message "long"
Then it should write "1 femtograms"

Scenario: Find ag's unit
Given that I have "1 ag"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-18
When I send message "long"
Then it should write "1 attograms"

Scenario: Find zg's unit
Given that I have "1 zg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-21
When I send message "long"
Then it should write "1 zeptograms"

Scenario: Find yg's unit
Given that I have "1 yg"
When I send message "base_unit"
Then I should have "g"
When I send message "value"
Then I should have 1.0e-24
When I send message "long"
Then it should write "1 yoctograms"
