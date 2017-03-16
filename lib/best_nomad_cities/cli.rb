class BestNomadCities::CLI

  def call
    BestNomadCities::Scraper.new.make_cities
    puts 'Welcome to Best Nomad Cities'
  end

  def print_cities(amount)
    puts ""
    puts "---------- Top #{amount} Nomad Cities ----------"
    puts ""
    BestNomadCities::City.all[0, amount].each.with_index(1) do |city, index|
      puts "#{index}. #{city.name}, #{city.country}"
    end
  end

end
