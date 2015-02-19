When(/^I enter "(.*?)"$/) do |coordinate|
  fill_in 'target', with: coordinate
end
