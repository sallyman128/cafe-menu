# API help page https://openweathermap.org/current#data

class TodaysWeather::OpenWeatherAPI

  # returns a hash of weather details from API
  def self.retrieve_data(zipcode, units)
    api_key = open('.env').read().strip # reassign this var to your own API key from OpenWeather. See README ##Usage.
    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode}&units=#{units}&appid=#{api_key}"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end