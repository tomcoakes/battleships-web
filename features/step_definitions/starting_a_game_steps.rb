Given(/^I am on the homepage$/) do
   visit('/')
end

When(/^I click "(.*?)"$/) do |arg1|
  click_button('New Game')
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end