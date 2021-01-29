class TodaysWeather::Weather
  attr_accessor :city, :temp, :temp_high, :temp_low

  def self.new_from_hash(api_hash)
    weather = self.new
    weather.city = api_hash["name"]
    weather.temp = api_hash["main"]["temp"]
    weather.temp_high = api_hash["main"]["temp_max"]
    weather.temp_low = api_hash["main"]["temp_min"]
    weather
  end
end