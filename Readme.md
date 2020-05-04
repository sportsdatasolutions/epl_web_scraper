## EPL Web Scraper

> This web scraper will specifically scrape goals scored data from the [Official EPL Website](https://www.premierleague.com/stats/top/players/goals)

![EPLSiteScreen](https://sportsdatasolutionsacademy.s3.eu-west-2.amazonaws.com/public/EPLsitescreen.png)

### Prerequisites

+ ***You need to have the [Chrome Browser](https://www.google.com/chrome/) installed.***

+ ***You need to have a driver installed for Chrome. Steps to install for MacOS below. WSL steps coming soon.***

```bash
# MacOS
$ brew tap homebrew/cask && brew cask install chromedriver
```

+ ***You'll also need Ruby and Bundler installed. Recommended versions below.***

```
$ ruby -v
>= 2.5.0
$ bundler -v
>= 1.16.0
```

### Running

First, ```bundle install``` to install gem dependencies. Consult Google on any bundle errors.

```
$ bundle install
```

There web scrraping script can be found in ```web_scraper_watir.rb```. It can be run via Ruby runtime. E.g.

```
$ ruby web_scraper_watir.rb
```

Once the scraper runs, you should see the relevant data appear in a new ```.json``` file. The ```watir``` scraper has an extra bit of code that clicks the pagination(next) button to scrape all the goal scores.

### Contributing

To contribute to this repository, **fork** to your own Github, create a **branch** and submit a **pull request** for your changes to be **reviewed and merged**.
