require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :home_page, :array

  def get_home_page
    @home_page = Nokogiri::HTML(open("https://nomadlist.com/"))
  end

  def get_cities
    @cities_container = @home_page.css("div[data-i]")
  end
  binding.pry

  def get_city_details

  end
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
