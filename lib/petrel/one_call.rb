module Petrel
  def self.one_call(params)
    one_call_url = "#{configuration.url}/onecall"
    query = params.merge(appid: configuration.api_key)
    HTTParty.get(one_call_url, query: query)
  end
end
