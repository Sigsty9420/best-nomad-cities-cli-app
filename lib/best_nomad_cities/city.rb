class BestNomadCities::City
  attr_accessor :name, :rank, :country, :cost, :internet_speed, :weather, :link, :tg_link

  @@all = []

  def self.new_from_home_page(city)
    self.new(
    city.css("h2").text,
    city.css("h3").text,
    city.css(".rank").text,
    city.css(".bottom-right").text,
    city.css(".top-right").text,
    "#{city.css(".metric").text} / #{city.css(".imperial").text}",
    "https://nomadlist.com#{city.css('a').attribute('href').value}",
    "https://nomadlist.com#{city.css('a').attribute('href').value}/travel-guide"
    )
  end

  def initialize(name = nil, country = nil, rank = nil,  cost = nil, internet_speed = nil, weather = nil, link = nil, tg_link = nil )
    @name = name
    @country = country
    @rank = rank
    @cost = nomad_cost_of_living
    @internet_speed = internet_speed
    @weather = weather
    @link = link
    @tg_link = travel_guide_link
    @@all << self
  end

  def self.all
    @@all
  end
end
