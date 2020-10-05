module Petrel
  module Configuration
    BASE_URL = 'https://api.openweathermap.org/data/2.5'

    attr_writer :api_key

    def api_key
      @api_key
    end

    def url
      BASE_URL
    end

    def configure
      yield self
    end
  end
end
