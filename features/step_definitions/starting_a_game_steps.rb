Given(/^I am on the homepage$/) do
   visit('/')
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page.has_content?(arg1)).to eq true
  # (alternative statement - why does this not work?) expect­('/new').to have_c­ont­ent­("What's your name?")
end