Feature: Shooting at cells
	In order to take my turn
	As a competitive player
	I want to shoot at a cell

	Background:
		Given I am on the homepage
		When I click "New Game"
		And I enter my name as "Gabe"
		And I push "submit"
		Then I should see "Gabe is now playing Battleships"

	Scenario: User can shoot at a cell without a ship and take another shot
		When I enter "A1"
		And I push "shoot"
		Then I should see "You missed!"
		Then I should see "Take a shot!"

	Scenario: User can shoot at a cell with a ship
		When I enter "A2"
		And I push "shoot"
		Then I should see "You hit the ship!"