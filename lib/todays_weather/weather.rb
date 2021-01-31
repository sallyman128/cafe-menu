class TodaysWeather::Weather
  attr_accessor :city, :temp, :temp_high, :temp_low, :date, :units, :main, :humidity, :wind, :zipcode

  WEATHER_UNITS = [
    {:display_name => "Standard (Kelvin)", :api_input => "standard", :degrees => "° Kelvin"},
    {:display_name => "Metric (Celsius)", :api_input => "metric", :degrees => "°C"},
    {:display_name => "Imperial (Fahrenheit)", :api_input => "imperial", :degrees => "°F"}
  ]

  @@all = []

  ## Class Methods

  # displays the possible weather unit options
  def self.display_units
    puts "\n"
    puts "Please select the number for your preferred unit of temperature measurement from the list, or type 'exit'."

    WEATHER_UNITS.each.with_index(1) do |units_hash, index|
      puts  "#{index}. #{units_hash[:display_name]}"
    end
  end

  # 
  def self.weather_units
    WEATHER_UNITS
  end

  # verifies if user input is valid for unit preference
  def self.valid_units?(input)
    valid = false
    if input.to_i >= 1 && input.to_i <= WEATHER_UNITS.size
      valid = true
    end
    valid
  end

  # verifies if user zipcode is a 5-digit number
  def self.possible_zipcode?(input)
    possible = false
    if input.to_i.to_s.size == 5
      possible = true
    end
    possible
  end

  # verifies if user zipcode is a valid U.S. zipcode
  def self.valid_zipcode?(api_hash)
    valid = false
    valid = true if api_hash["cod"] == 200
    valid
  end

  # creates new instance of Weather from the api hash
  def self.new_from_api(api_hash)
    weather = self.new
    weather.city = api_hash["name"]
    weather.temp = api_hash["main"]["temp"]

    weather.temp_high = api_hash["main"]["temp_max"]
    weather.temp_low = api_hash["main"]["temp_min"]
    weather.main = api_hash["weather"].first["main"]
    weather.humidity = api_hash["main"]["humidity"]
    weather.wind = api_hash["wind"]["speed"]
    weather
  end

  ## Instance Methods

  # defines attributes of a new Weather instance
  def initialize
    @date = Time.now.strftime("%d/%m/%Y %H:%M")
    @city = nil
    @temp = nil
    @temp_high = nil
    @temp_low = nil
    @main = nil
    @humidity = nil
    @wind = nil
    @units = nil
    @zipcode = nil
    @@all << self
  end
end