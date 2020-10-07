require 'spec_helper'

RSpec.describe Petrel::Configuration do
  describe '.configure' do
    it 'returns the set values' do
      api_key = 'mock_api_key'

      Petrel.configure do |c|
        c.api_key = api_key
      end

      expect(Petrel.configuration.api_key).to eq(api_key)
      expect(Petrel.configuration.url).to eq(
        'https://api.openweathermap.org/data/2.5'
      )
    end
  end
end
