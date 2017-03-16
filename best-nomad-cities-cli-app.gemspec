require_relative './lib/best_nomad_cities/version'

Gem::Specification.new do |s|
  s.name        = 'best-nomad-cities'
  s.version     = BestNomadCities::VERSION
  s.date        = '2016-03-16'
  s.summary     = "Best Nomad Cities"
  s.description = "Provides a list of the top Nomad Cities from around the world."
  s.authors     = ["Henno Fourie"]
  s.email       = 'bortch@gmail.com'
  s.files       = ["lib/best_nomad_cities.rb", "lib/best_nomad_cities/cli.rb", "lib/best_nomad_cities/scraper.rb", "lib/best_nomad_cities/city.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/best-nomad-cities'
  s.license     = 'MIT'
  s.executables << 'best-nomad-cities'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end
