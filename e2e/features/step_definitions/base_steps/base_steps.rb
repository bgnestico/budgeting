require 'watir'
require 'cucumber'

Given(/^I open page "([^"]*)"$/) do |url|
  args = ['--disable-infobars',
          '--disable-translate',
          '--disable-popup-blocking']
  @Browser = Watir::Browser.new :chrome, options: {args: args}
  @Browser.goto ("#{'localhost:8080' + url}")
end
