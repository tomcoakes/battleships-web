Given(/^I am on the homepage$/) do
   visit('/')
end

When(/^I click "(.*?)"$/) do |arg1|
  click_on(arg1)
end

When(/^I enter my name as "(.*?)"$/) do |name|
  fill_in('name', :with => "name")
end

When(/^I press submit$/) do
  click_button('submit')
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end