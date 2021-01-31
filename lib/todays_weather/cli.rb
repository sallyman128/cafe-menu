class TodaysWeather::CLI

  # provides overall user-experience flow
  def call
    puts "\nGreetings!"
    self.get_units

    until @exit == true do
      self.get_zipcode

      weather_hash = TodaysWeather::OpenWeatherAPI.retrieve_data(@zipcode, @units[:api_input])
      
      if TodaysWeather::Weather.valid_zipcode?(weather_hash)
        self.pull_weather(weather_hash) unless @exit == true
        self.more_details unless @exit == true
      else
        puts "\nSorry. The zipcode you searched cannot be found."
      end
    end

    self.goodbye
  end

  # requests user to input their preferred unit of weather measurement
  def get_units
    input = ""
    TodaysWeather::Weather.display_units
    input = gets.chomp.downcase

    until TodaysWeather::Weather.valid_units?(input) || input == "exit" do
      puts "\nSorry I didn't understand that."
      TodaysWeather::Weather.display_units
      input = gets.chomp.downcase
    end

    if input == "exit"
      @exit = true
    else
      @units = TodaysWeather::Weather.weather_units[input.to_i - 1]
      puts "\nYou've selected to show the weather in #{@units[:display_name]}."
    end
  end

  # loops until user provides a 5-digit input that could possibly be a zipcode.
  def get_zipcode
    puts "\nPlease input a 5-digit zipcode or type 'exit'."
    input = gets.chomp.downcase

    until TodaysWeather::Weather.possible_zipcode?(input) || input == "exit" do
      puts "\nSorry, I didn't catch that."
      puts "\nPlease input a 5-digit zipcode or type 'exit'."
      input = gets.chomp.downcase
    end

    if input == "exit"
      @exit = true
    else
      @zipcode = input
    end
  end

  # creates weather class instance and states the basic weather information provided from api
  def pull_weather(weather_hash)
    @weather = TodaysWeather::Weather.new_from_api(weather_hash)
    @weather.units = @units[:api_input]
    @weather.zipcode = @zipcode
    puts "\nIt is currently #{@weather.temp}#{@units[:degrees]} with #{@weather.main.downcase} in #{@weather.city}."
  end

  # gives user more weather info stored in weather instance from api
  def more_details
    puts "\nWould you like more details on the weather?"
    puts "Type 'y' to get more details, 'n' to check a new zipcode, or 'exit'."
    input = gets.chomp.downcase

    # loops until until user provides valid input
    until ["y","n"].include?(input) || input == 'exit' do
      puts "\nSorry, I didn't understand that."
      puts "\nWould you like more details on the weather?"
      puts "Type 'y' to get more details, 'n' to check a new zipcode, or 'exit'."
      input = gets.chomp.downcase
    end

    if input == "y"
      puts "\nLocation: #{@weather.city}"
      puts "Zipcode: #{@zipcode}"
      puts "Status: #{@weather.main}" 
      puts "Current Temperature: #{@weather.temp}#{@units[:degrees]}"
      puts "High Temperature: #{@weather.temp_high}#{@units[:degrees]}"
      puts "Low Temperature: #{@weather.temp_low}#{@units[:degrees]}"
      puts "Humidity: #{@weather.humidity}%"
    elsif input == "exit"
      @exit = true
    end
  end

  # farewell to the user
  def goodbye
    puts "\n"
    puts "Seeya later!"
    puts "\n"
  end
end