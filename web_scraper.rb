require 'json'
require 'open-uri'

# Set API URL
url = "https://footballapi.pulselive.com/football/stats/ranked/players/goals?page=0&pageSize=20&compSeasons=210&comps=1&compCodeForActivePlayer=EN_PR&altIds=true"

# Assign API response to 'goals'
goals = JSON.parse(open(url).read)

# Save Goals Array into JSON file.
File.write('goals_2018_2019.json', JSON.dump(goals))
