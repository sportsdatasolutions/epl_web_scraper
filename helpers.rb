module Helpers
  def scrape_table_data(web_page, goals)
    data_table = web_page.at('tbody.statsTableContainer')

    data_table.css('tr').each do |row|
      goals.push ({
        rank: scraped_rank(row),
        player: scraped_player(row),
        club: scraped_club(row),
        nationality: scraped_nationality(row),
        goals: scraped_stat(row)
      })
    end
  end

  private

  def scraped_rank(row)
    row.css('td')[0].css('strong').text.tr('.', '').to_i
  end

  def scraped_player(row)
    row.css('td')[1].css('a').css('strong').text
  end

  def scraped_club(row)
    row.css('td')[2].css('a').text.strip
  end

  def scraped_nationality(row)
    row.css('td')[3].css('div').css('span')[1].text.strip
  end

  def scraped_stat(row)
    row.css('td')[4].text.to_i
  end
end
