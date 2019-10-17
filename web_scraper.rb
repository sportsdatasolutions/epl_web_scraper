require 'open-uri'
require 'json'
require 'nokogiri'
require 'watir'
require_relative 'helpers.rb'

include Helpers

# Goals Array
goals = []

# Create Watir Browser Object to interact with Chrome. Headless means the browser won't physically open up on the screen.
browser = Watir::Browser.new :chrome, headless: true

# Set Web Page URL
url = "https://www.premierleague.com/stats/top/players/goals?se=210"

puts "Start"

# Start loading Web Page
browser.goto(url)

# Wait for current season stats to load
sleep 4

# Perform HTML Scrape
scrape_table_data(browser.html, goals)

puts "Done"

# Save Goals Array into JSON file.
File.write("data/goals_top_2018_2019.json", goals.to_json)
