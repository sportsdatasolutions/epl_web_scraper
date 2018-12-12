require 'open-uri'
require 'json'
require 'nokogiri'
require 'watir'
require_relative 'helpers.rb'

include Helpers

goals = []

# Create Watir Browser Object to interact with Chrome. Headless means the browser won't physically open up on the screen.
browser = Watir::Browser.new :chrome, headless: true

# Set Web Page URL
url = "https://www.premierleague.com/stats/top/players/goals?se=210"

# Start loading Web Page
browser.goto(url)

# Wait for current season stats to load
sleep 5

# Turn Watir Browser HTML into a Nokogiri object
web_page = Nokogiri::HTML(browser.html)

scrape_table_data(web_page, goals)

# Save Goals Array into JSON file.
File.write('goals_2018_2019.json', goals.to_json)
