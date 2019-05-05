
#########
# GIVEN
#########

#########
# WHEN
#########

When(/^I press on the New Unit button$/) do
  find_element(id: "btn_new_custom_unit").click
end

When(/^I press on the OK button on the Custom conversions screen$/) do
  find_element(id: "btn_custom_conversion_details_ok").click
end

#########
# THEN
#########

Then(/^I press on Create Your First Conversion button$/) do
  find_element(id: "btn_new_custom_conversion").click
end

Then(/^I type "([^"]*)" as a custom conversion name$/) do |name|
  find_element(id: "edit_custom_conversion_category_name").send_keys(name)
end

Then(/^I type "([^"]*)" as a unit name$/) do |unit_name|
  find_element(id: "edit_custom_conversion_unit_dtls_name").send_keys(unit_name)
end

Then(/^I type "([^"]*)" as a unit symbol$/) do |symbol_name|
  find_element(id: "edit_custom_conversion_unit_dtls_symbol").send_keys(symbol_name)
end

Then(/^I type "([^"]*)" as a unit value$/) do |unit_value|
  find_element(id: "edit_custom_conversion_unit_dtls_value").send_keys(unit_value)
end

Then(/^I press submit checkmark on the Custom Conversions screen$/) do
  find_element(id: "action_confirm_custom_unit").click
end

Then(/^I verify "([^"]*)" is added to the Custom Conversions list$/) do |conversion_name|
  text(conversion_name)
end
