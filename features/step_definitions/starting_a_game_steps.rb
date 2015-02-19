Given(/^I am on the homepage$/) do
   visit('/')
end

When(/^I click "(.*?)"$/) do |new_game|
  click_on(new_game)
end

When(/^I enter my name as "(.*?)"$/) do |name|
  fill_in('name', :with => "Gabe")
end

When(/^I push "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |welcome_message|
  expect(page).to have_content welcome_message
end