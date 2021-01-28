# api.openweathermap.org/data/2.5/weather?q={city name},{state code},{country code}&appid={API key}

class TodaysWeather::WeatherAPI

  def self.body_getter(zip, units)
    
    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zip}&units=#{units}&appid=6744bcff04ce8b1ea8f5db70442f4d30"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    x = JSON.parse(response)
    binding.pry
  end
end