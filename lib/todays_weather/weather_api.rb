# API help page https://openweathermap.org/current#data

class TodaysWeather::OpenWeatherAPI

  # extracts a hash of weather details from API
  def self.weather_data_getter(zip, units)
    api_key = File.open('.env').read()
    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zip}&units=#{units}&appid=#{api_key}"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end