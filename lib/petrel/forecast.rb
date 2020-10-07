module Petrel
  def self.forecast(params)
    weather_url = "#{configuration.url}/forecast"
    query = params.merge(appid: configuration.api_key)
    HTTParty.get(weather_url, query: query)
  end
end
