Feature: Convert between meters 
In order to calculate between meters
As a user
I can take a base meter can derive other meters

Scenario: 1 km in hm
Given that I have "1 km"
When I send message "to_hm"
Then I should have "10.0 hm"
And it should write "10.0 hectometers"


Scenario: 1 hm in dm
Given that I have "1 hm"
When I send message "to_dm"
Then I should have "10 dm"
And it should write "10.0 decameters"


Scenario: 1 dm in km
Given that I have "1 dm"
When I send message "to_km"
Then I should have "0.01 km"
And it should write "0.01 kilometers"
