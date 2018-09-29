require 'watir'
require 'cucumber'
require 'rspec'

When("the Inflow vs Outflow report is generated") do
  btn = @Browser.a(:text => 'Reports')
  btn.exists?
  btn.click
end

Then("the inflow amount is accurate") do
  inflow_report = (@Browser.element(css: "g:nth-child(1) > text._1UVu9").text).gsub(/[^0-9.-]/,"")
  @inflow_report = inflow_report.to_f
  expect(@inflow_report).to eq @inflow_after
end

Then("the outflow amount is accurate") do
  outflow_report = (@Browser.element(css: "g:nth-child(2) > text._1UVu9").text).gsub(/[^0-9.-]/,"")
  @outflow_report = outflow_report.to_f
  expect(@outflow_report).to eq @outflow_after
end
