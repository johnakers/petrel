module Petrel
  def self.weather(params)
    weather_url = "#{url}/weather"
    query = params.merge(appid: api_key)
    HTTParty.get(weather_url, query: query)
  end
end
