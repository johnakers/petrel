module Petrel
  def self.one_call(params)
    one_call_url = "#{url}/onecall"
    query = params.merge(appid: api_key)
    HTTParty.get(one_call_url, query: query)
  end
end
