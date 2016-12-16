require 'watir-webdriver'


Before do
  @browser = Watir::Browser.new :chrome
end

After do
  sleep 2
end