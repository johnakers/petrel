module Petrel
  def self.forecast(params)
    weather_url = "#{url}/forecast"
    query = params.merge(appid: api_key)
    HTTParty.get(weather_url, query: query)
  end
end
