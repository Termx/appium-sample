
#########
# GIVEN
#########

Given(/^I land on the Home screen$/) do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

#########
# WHEN
#########

When(/^I press on the Menu icon$/) do
  find_element(accessibility_id: "Open navigation drawer").click
end

When(/^I press on the My Conversions button$/) do
  text("My conversions").click
end

#########
# THEN
#########

Then(/^I should see the left side menu$/) do
  text("Unit Converter")
end

Then(/^I land on the My Conversions screen$/) do
  text("No personal conversion created yet")
end
