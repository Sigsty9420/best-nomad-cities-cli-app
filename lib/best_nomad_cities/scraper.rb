class BestNomadCities::Scraper

  def get_home_page
    Nokogiri::HTML(open('fixtures/html/nomadlist.html'))
  end

  def get_cities
    self.get_home_page.css("div[data-i]")
  end

  def make_cities
    self.get_cities.each do |city|
      BestNomadCities::City.new_from_home_page(city)
    end
  end
end
