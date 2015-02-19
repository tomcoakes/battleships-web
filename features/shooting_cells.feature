Feature: Shooting at cells
	In order to take my turn
	As a competitive player
	I want to shoot at a cell

	Scenario: User can shoot at a cell without a ship
		Given I have registered
		When I enter "A1"
		And I press shoot
		Then I should see "You missed!"