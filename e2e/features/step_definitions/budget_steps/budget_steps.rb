require 'watir'
require 'cucumber'
require 'rspec'


Given("I check the current balance") do
  inflow_before = (@Browser.div(class: ['sG1fB', '_1yrus'], :index => 0).text).gsub(/[^0-9.-]/,"")
  @inflow_before = inflow_before.to_f
  print(@inflow_before)
  outflow_before = (@Browser.div(class: ['sG1fB', '_15b6X']).text).gsub(/[^0-9.-]/,"")
  @outflow_before = outflow_before.to_f
  print(@outflow_before)
  balance_before = (@Browser.div(class: ['sG1fB', '_1yrus'], :index => 1).text).gsub(/[^0-9.-]/,"")
  @balance_before = balance_before.to_f
  print(@balance_before)
end

When(/user select a category "([^"]*)"$/) do |category|
  btn = @Browser.select(name: 'categoryId')
  btn.exists?
  btn.select("#{category}")
end

And(/fill the description "([^"]*)"$/) do |description|
  field = @Browser.text_field(name: 'description')
  field.exists?
  field.set ("#{description}")
end

And(/fill the value "([^"]*)"$/) do |value|
  field = @Browser.text_field(name: 'value')
  field.exists?
  field.set ("#{value}")
end

And("click on add button") do
  btn = @Browser.button(:text => 'Add')
  btn.exists?
  btn.click
end

Then(/category "([^"]*)" is added with description "([^"]*)" and value "([^"]*)"$/) do |category, description, value|
  category = @Browser.div(class: '_3-t-g', :text => ("#{category}"))
  category.exists?
  description = @Browser.div(class: '_3-t-g', :text => ("#{description}"))
  description.exists?
  value = @Browser.div(class: '_3-t-g', :text => ("#{value}"))
  value.exists?
end

And(/the total inflow value "([^"]*)" is accurate$/) do |value|
  inflow_after = (@Browser.div(class: ['sG1fB', '_1yrus'], :index => 0).text).gsub(/[^0-9.-]/,"")
  @inflow_after = inflow_after.to_f
  value = ("#{value}").gsub(/[^0-9.-]/,"")
  @value = value.to_f
  expect(@inflow_after).to eq @inflow_before + @value
end

And(/the total outflow value "([^"]*)" is accurate$/) do |value|
  outflow_after = (@Browser.div(class: ['sG1fB', '_15b6X']).text).gsub(/[^0-9.-]/,"")
  @outflow_after = outflow_after.to_f
  value = ("#{value}").gsub(/[^0-9.-]/,"")
  @value = value.to_f
  expect(@outflow_after).to eq @outflow_before - @value
end

And("the total working balance is accurate") do
  balance_after = (@Browser.div(class: ['sG1fB', '_1yrus'], :index => 1).text).gsub(/[^0-9.-]/,"")
  @balance_after = balance_after.to_f
  if @value < 0 and -(@value) > @balance_before
    expect(@balance_after).to be < 0, "The balance should be negative"
  end
  expect(@balance_after).to eq @balance_before + @value
end
