class City
  attr_accessor :city_name, :global_rank, :region, :country, :nomad_cost, :internet_speed, :weather

  def self.new_from_home_page(page)
    self.new()
  end

  def initialize(city_name = nil, global_rank = nil,region = nil, country = nil, population = nil, nomad_cost = nil, internet_speed = nil, weather = nil, air_quality = nil, best_coffee_place = nil, best_cowork_space = nil )

  end
end
