Given(/^I am on the homepage$/) do
   visit('/')
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link(arg1)
end

When(/^I enter my name as "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I press submit$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end