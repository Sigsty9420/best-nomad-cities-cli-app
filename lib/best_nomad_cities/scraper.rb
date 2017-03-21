class BestNomadCities::Scraper

  def get_home_page
    Nokogiri::HTML(open('fixtures/html/nomadlist.html'))
  end

  def get_cities
    self.get_home_page.css("div[data-i]")
  end

  def make_cities
    self.get_cities.each do |city|
      city_attributes(city)
    end
  end

  def city_attributes(city)
    attrs = {
      name: city.css("h2").text,
      country: city.css("h3").text,
      rank: city.css(".rank").text,
      cost: city.css(".bottom-right").text,
      internet_speed: city.css(".top-right").text,
      weather: "#{city.css(".metric").text} / #{city.css(".imperial").text}",
      link: city.css('a').attribute('href').value,
      tg_link: "#{city.css('a').attribute('href').value}/travel-guide"
    }
    BestNomadCities::City.new(attrs)
  end
end
