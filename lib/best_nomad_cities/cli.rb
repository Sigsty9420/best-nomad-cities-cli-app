class BestNomadCities::CLI

  def call
    BestNomadCities::Scraper.new.make_cities
    puts 'Welcome to Best Nomad Cities'
    end

end
