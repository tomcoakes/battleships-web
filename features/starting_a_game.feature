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
		