module Petrel
  class Configuration
    attr_reader :url
    attr_accessor :api_key

    def initialize
      @url = 'https://api.openweathermap.org/data/2.5'
    end
  end
end
