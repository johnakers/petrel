module Petrel
  def self.weather(params)
    weather_url = "#{configuration.url}/weather"
    query = params.merge(appid: configuration.api_key)
    HTTParty.get(weather_url, query: query)
  end
end
