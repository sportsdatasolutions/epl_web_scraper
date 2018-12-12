require 'open-uri'
require 'json'
require 'nokogiri'
require 'watir'
require_relative 'helpers.rb'

include Helpers

# Goals Array
goals = []

# Create Watir Browser Object to interact with Chrome. Headless means the browser won't physically open up on the screen.
browser = Watir::Browser.new :chrome, headless: false

# Set Web Page URL
url = "https://www.premierleague.com/stats/top/players/goals?se=210"

# Start loading Web Page
browser.goto(url)

# Wait for current season stats to load
sleep 4

# Perform HTML Scrape (First Page)
scrape_table_data(browser.html, goals)

# Perform HTML Scrape (Next Pages Until the next button is inactive)
until browser.div(class: ["paginationBtn", "paginationNextContainer", "inactive"]).exists?
  browser.div(class: ["paginationBtn", "paginationNextContainer"]).fire_event :click
  sleep 2
  scrape_table_data(browser.html, goals)
end

# Save Goals Array into JSON file.
File.write('goals_2018_2019.json', goals.to_json)
