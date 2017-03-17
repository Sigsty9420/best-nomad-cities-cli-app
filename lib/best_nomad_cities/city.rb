class BestNomadCities::City
  attr_accessor :name, :rank, :country, :cost, :internet_speed, :weather, :link, :tg_link

  @@all = []

  def self.new_from_home_page(city)
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

    self.new(attrs)
  end

  def initialize(attrs)
    @name = attrs[:name]
    @country = attrs[:country]
    @rank = attrs[:rank]
    @cost = attrs[:cost]
    @internet_speed = attrs[:internet_speed]
    @weather = attrs[:weather]
    @link = attrs[:link]
    @tg_link = attrs[:tg_link]
    @@all << self
  end

  def self.all
    @@all
  end
end
