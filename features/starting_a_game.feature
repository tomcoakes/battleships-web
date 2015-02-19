Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering
		Given I am on the homepage
		When I click "New Game"
		And I enter my name as "Gabe"
		And I push "submit"
		Then I should see "Gabe is now playing Battleships"

	Scenario: User doesn't enter name
		Given I am on the homepage
		When I click "New Game"
		And I push "submit"
		Then I should see "Name"
		
