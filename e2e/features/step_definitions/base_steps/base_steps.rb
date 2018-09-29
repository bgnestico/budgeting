require 'watir'
require 'cucumber'

Given(/^I open page "([^"]*)"$/) do |url|
  args = ['--disable-infobars',
          '--disable-translate',
          '--disable-popup-blocking',
          '--user-data-dir=/tmp/unsafe',
          '--unsafely-treat-insecure-origin-as-secure=http://localhost:8000']
  @Browser = Watir::Browser.new :chrome, options: {args: args}
  @Browser.goto ("#{'http://localhost:8000' + url}")
end

And("I close the browser") do
  @Browser.quit
end
