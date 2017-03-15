require_relative '../../config/environment'

class Scraper

  attr_accessor :home_page, :array

  def self.get_home_page
    @home_page = Nokogiri::HTML(open("https://nomadlist.com/"))
  end

  def self.get_cities
    @cities_container = @home_page.css("div[data-i]")
  end


  def self.get_city_travel_guide
    @city_page = Nokogiri::HTML(open("https://nomadlist.com#{@cities_container[1].css('a').attribute('href').value}/travel-guide" ))
  end
  binding.pry
end


#home_page.css("div.grid show view")
#h = home_page.css("div[data-i]") <- there are 993 cities
# "#{h[899].css("h2.itemName").text}, #{h[899].css("h3.itemSub").text}"

#cities = []
#array.each do |i|
#  cities << i.css("h2.itemName").text
#end
# cities returns an array of cities :)

#i = 0
#while i < 10
#  @array << @home_page.css("div[data-i='#{i+1}']")
#  i += 1
#end

#[5] pry(Scraper)> @cities_container[0].css("h2").text
#=> "Chiang Mai"

#[6] pry(Scraper)> @cities_container[0].css("h3").text
#=> "Thailand"

#[8] pry(Scraper)> @cities_container[0].css(".top-right").text
#=> "35mbps"

#[14] pry(Scraper)> @cities_container[0].css(".bottom-right").text
#=> "$595 / m"

#[19] pry(Scraper)> @cities_container[0].css(".metric").text
#=> "36°C"

#[20] pry(Scraper)> @cities_container[0].css(".imperial").text
#=> "96°F"

#[18] pry(Scraper)> @cities_container[0].css(".rank").text
#=> "1"

#[50] pry(Scraper)> @cities_container[1].css('a').attribute('href').value
#=> "/miami-fl-united-state
