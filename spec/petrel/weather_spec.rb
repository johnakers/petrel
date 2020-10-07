require 'spec_helper'

RSpec.describe Petrel do
  describe '.weather' do
    let(:query) do
      {
        q: 'San Francisco'
      }
    end

    let(:weather_response) do
      double(
        code: 200,
        parsed_response: {
          'coord' => {
            'lon' => -122,
            'lat' => 37
          },
          'weather' => [
            {
              'id' => 801,
              'main' => 'Clouds',
              'description' => 'few clouds',
              'icon' => '02n'
            }
          ],
          'base' => 'stations',
          'main' => {
            'temp' => 288.88,
            'feels_like' => 286.78,
            'temp_min' => 286.15,
            'temp_max' => 290.37,
            'pressure' => 1014,
            'humidity' => 93
          },
          'visibility' => 10000,
          'wind' => {
            'speed' => 5.1,
            'deg' => 300
          },
          'clouds' => {
            'all' => 20
          },
          'dt' => 1601805220,
          'sys' => {
            'type' => 1,
            'id' => 5817,
            'country' => 'US',
            'sunrise' => 1601820499,
            'sunset' => 1601862470
          },
          'timezone' => -25200,
          'id' => 5391959,
          'name' => 'San Francisco',
          'cod' => 200
        }
      )
    end

    before do
      allow(HTTParty).to receive(:get).
        and_return(weather_response)

      Petrel.configure do |c|
        c.api_key = 'mock_api_key'
      end
    end

    it 'returns the current weather' do
      expect(HTTParty).to receive(:get).
        with("#{Petrel.configuration.url}/weather", query: {
          q: 'San Francisco',
          appid: Petrel.configuration.api_key
        }).
        and_return(weather_response)

      Petrel.weather(query)
    end
  end
end
