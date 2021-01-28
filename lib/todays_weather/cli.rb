class TodaysWeather::CLI

  def call
    get_zipcode
    get_units
    TodaysWeather::WeatherAPI.body_getter(@zipcode, @units)
  end

  def get_zipcode
    puts "Please input a 5-digit zipcode."
    @zipcode = gets.chomp

    until @zipcode.length == 5 do
      puts "Please input a 5-digit zipcode."
      @zipcode = gets.chomp
    end
    @zipcode
  end

  def get_units
    @units = "metric"
  end
end