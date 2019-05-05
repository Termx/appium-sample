
#########
# GIVEN
#########


#########
# WHEN
#########

When(/^I press on the Clear button$/) do
  puts("clear button is pressed")
end

When(/^I type "([^"]*)" on the application keyboard$/) do |target|
  digits = target.split("")
  digits.each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
end

When(/^I press delete from history at (\d+)st row$/) do |index|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end

#########
# THEN
#########

Then(/^the Left Unit picker value should be "([^"]*)"$/) do |value|
  actual_picker_text = find_elements(id: "select_unit_spinner")[0].text
  if actual_picker_text != value
    fail("Expected left unit picker value is #{value}, actual value is #{actual_picker_text}")
  end
end

Then(/^the Right unit picker value should be "([^"]*)"$/) do |value|
  array_of_elements = find_elements(id: "select_unit_spinner")
  actual_picker_text = array_of_elements[1].text
  if actual_picker_text != value
    fail("Expected right unit picker value is #{value}, actual value is #{actual_picker_text}")
  end
end

Then(/^the Show All button should be (enabled|disabled)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?
  if state == "enabled"
    fail("Expected to be enabled") if button_state != true
  elsif state == "disabled"
    fail("Expected to be disabled") if button_state != false
  end
end

Then(/^I should see the result as "([^"]*)"$/) do |result|
  value = find_element(id: "target_value").text

  if value != result
    fail("expected value is #{result}, actual value is #{value}")
  end
end

Then(/^I press on the Add to Favorites icon$/) do
  find_element(id: "action_add_favorites").click
end

Then(/^I press on the Favorite conversions$/) do
  text("Favorite conversions").click
end

Then(/^I press on the search icon$/) do
  find_element(id: "action_search").click
end

Then(/^I type "([^"]*)" in the search field$/) do |text|
  find_element(id: "search_src_text").send_keys(text)
end

Then(/^I press the return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end

Then(/^I see "([^"]*)" as a current unit converter$/) do |current_unit|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end

Then(/^I select "([^"]*)" from the left unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(value)
end

Then(/^I select "([^"]*)" from the menu$/) do |value|
  text(value).click
end

Then(/^I select "([^"]*)" from the right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(value)
end

Then(/^I should see the text "([^"]*)"$/) do |value|
  text(value)
end

#########
# AND
#########

And(/^I verify "([^"]*)" is added to Favorite conversions list$/) do |unit_type|
  item_text = find_element(id: "favorites_item_hint").text
  if unit_type != item_text
    fail("Cannot find #{unit_type} in Favorite list")
  end
end

And(/^I verify that the (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text
  if actual_text != text
    fail("Expected text is #{text}, actual text is #{actual_text}")
  end
end
