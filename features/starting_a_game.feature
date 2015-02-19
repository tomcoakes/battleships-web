Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering
		Given I am on the homepage
		When I click "New Game"
		And I enter my name as "Gabe"
		And I press submit
		Then I should see "Welcome to battleships Gabe"

	Scenario: User doesn't enter name
		Given I am on the homepage
		When I click "New Game"
		And I press submit
		Then I should see "Name"
		
	Scenario: User can shoot at a cell without a ship
		Given I have registered
		When I enter a coordinate
		And I press shoot
		Then I should see "You missed!"