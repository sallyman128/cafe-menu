class TodaysWeather::CLI

  # the one method that provides overall user-experience flow
  def call
    @zipcode = nil
    self.get_units
    self.show_weather
    self.goodbye
  end

  # prompts user to select their preferred units or type 'exit'
  def get_units
    input = nil

    until (input.to_i >= 1 && input.to_i <= 3) || input == 'exit' do
      puts "\n"
      puts "Please select your preferred unit of temperature measurement from the list, or type 'exit'."
      puts "  1. Standard (Kelvin)"
      puts "  2. Metric (Celsius)"
      puts "  3. Imperial (Fahrenheit)"
      puts "\n"

      input = gets.chomp()
      puts "\n"
    end

    case input
    when "1"
      puts "You've selected to show the weather in Standard units."
      @units = "standard"
      @degrees = "° Kelvin"
    when "2"
      puts "You've selected to show the weather in Metric units."
      @units = "metric"
      @degrees = "°C"
    when "3"
      puts "You've selected to show the weather in Imperial units."
      @units = "imperial"
      @degrees = "°F" 
    when 'exit'
      @zipcode = 'exit'
    end
  end

  # takes @zipcode and @units and sends to #display_weather
  def show_weather
    until @zipcode == 'exit' do
      self.get_zipcode
      self.display_weather unless @zipcode == 'exit'
    end
  end

  # prompts user to input a valid 5-digit zipcode or type exit
  def get_zipcode
    puts "\n"
    puts "Please input a 5-digit zipcode or type 'exit'."
    @zipcode = gets.chomp.downcase

    # the .to_i and .to_s is meant to catch invalid inputs of 5 non-number characters.
    until @zipcode.to_i.to_s.size == 5 || @zipcode == 'exit' do
      puts "\n"
      puts "Sorry, I don't know what you're asking."
      puts "Please input a 5-digit zipcode or type 'exit'."
      puts "\n"

      @zipcode = gets.chomp.downcase
    end
  end

  # calls upon OpenWeatherAPI to pull weather data for the provided zipcode and units. returns a hash.
  def get_weather_hash
    @weather_hash = TodaysWeather::OpenWeatherAPI.weather_data_getter(@zipcode, @units)
  end

  # gets weather hash from the API method and determines if zipcode exists or not. Then outputs desired weather info.
  def display_weather
    weather_hash = self.get_weather_hash

    if weather_hash["cod"] == 200
      weather = TodaysWeather::Weather.new_from_hash(weather_hash)
      puts "\n"
      puts "  The current temperature is #{weather.temp}#{@degrees} in #{weather.city}."
      puts "  The temperature has a low of #{weather.temp_low}#{@degrees} and a high of #{weather.temp_high}#{@degrees}."
    else
      puts "\n"
      puts "Sorry. The zipcode you searched cannot be found."
    end
  end

  # farewell to the user
  def goodbye
    puts "\n"
    puts "Seeya later!"
    puts "\n"
  end
end