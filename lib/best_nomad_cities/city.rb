class BestNomadCities::City
  attr_accessor :name, :rank, :country, :cost, :internet_speed, :weather, :link, :tg_link

  @@all = []

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

  def self.sort_by_cost
    @@all.sort! do |a,b|
      b.cost.scan(/\d/).join('').to_i <=> a.cost.scan(/\d/).join('').to_i
    end
  end
end
