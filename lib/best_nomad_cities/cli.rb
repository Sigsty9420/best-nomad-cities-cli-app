class BestNomadCities::CLI
  def call
    BestNomadCities::Scraper.new.make_cities
    puts 'Welcome to Best Nomad Cities'
    start
  end

  def start
    puts ''
    puts 'What would you like to do?'
    puts ''
    puts '1. See a ranked list of nomad cities?'
    puts '2. Search for a city by name?'
    puts '3. Exit'
    puts ''
    choice = gets.strip.to_i

    if choice == 1
      puts ''
      puts 'How many cities would you like in your list?'
      puts ''
      amount = gets.strip.to_i
      print_cities(amount)
    elsif choice == 2
      puts ''
      puts "Please enter city name. If located in the US, please add the state if possible. (Example: 'New York, NY')"
      puts ''
      search = gets.strip
      search_city_by_name_or_number(search)
      puts ''
      puts "Would you like to see other cities? (Y or N)"
      y_or_n = gets.strip
      if y_or_n == "Y"
        start
      else
        puts ''
        puts "'Don't listen to what they say. GO SEE!'"
        exit
      end
    elsif choice == 3
      puts ''
      puts "'A good traveller has no fixed plans and is not intent on arriving.' - Lao Tzu"
      exit
    else
      puts ''
      puts "If at first you don't succeed, try again."
      start
    end
  end

  def print_cities(amount)
    puts ''
    puts "---------- Top #{amount} Nomad Cities ----------"
    puts ''
    BestNomadCities::City.all[0, amount].each.with_index(1) do |city, index|
      puts "#{index}. #{city.name}, #{city.country}"
    end
    puts ''
  end

  def search_city_by_name_or_number(search)
    if search.length > 3
      found_city = BestNomadCities::City.all.detect {|city| city.name.start_with?(search)}
    else
      found_city = BestNomadCities::City.all[search.to_i-1]
    end
    puts ''
    puts "---------- City: #{found_city.name} ----------"
    puts ''
    puts "Global nomad rank:            #{found_city.rank}"
    puts "Country:                #{found_city.country}"
    puts "Nomad cost:             #{found_city.cost}"
    puts "Internet speed:         #{found_city.internet_speed}"
    puts "Weather (now):          #{found_city.weather}"
    puts "Link to city page:      #{found_city.link}"
    puts "Link to travel guide:   #{found_city.tg_link}"
    puts ''
    puts "Hold 'cmd' on Mac to click the links."

  end
end
