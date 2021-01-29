# API help page https://openweathermap.org/current#data

class TodaysWeather::WeatherAPI

  # extracts a hash of weather details from API
  def self.weather_data_getter(zip, units)
    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zip}&units=#{units}&appid=6744bcff04ce8b1ea8f5db70442f4d30"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end