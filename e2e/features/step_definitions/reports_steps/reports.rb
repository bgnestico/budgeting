require 'watir'
require 'cucumber'
require 'rspec'

When("the Inflow vs Outflow report is generated") do
  btn = @Browser.element(:text => 'Reports')
  btn.exists?
  btn.click
end

Then("the inflow amount is accurate") do
  inflow_report = (@Browser.text(class: ['_1UVu9'], :index => 0).text).gsub(/[^0-9]/,"")
  inflow_report.exists?
  inflow_report = inflow_report.to_f
  print(inflow_report)
  expect(inflow_report).to eq True
end
