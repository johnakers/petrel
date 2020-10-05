require 'spec_helper'

RSpec.describe Petrel do
  describe '.forecast' do
    let(:query) do
      {
        lat: 37,
        lon: -122
      }
    end

    let(:forecast_response) do
      double(
        code: 200,
        parsed_response: {
          'cod' => '200',
          'message' => 0,
          'cnt' => 40,
          'city' => {
            'id' => 5339111,
            'name' => 'Concord',
            'coord' => {
              'lat' => 38,
              'lon' => -122
            },
            'country' => 'US',
            'population' => 122067,
            'timezone' => -25200,
            'sunrise' => 1601820404,
            'sunset' => 1601862363
          },
          'list' => [
            {
              'dt' => 1601877600,
              'main' => {
                'temp' => 293.98,
                'feels_like' => 292.18,
                'temp_min' => 293.98,
                'temp_max' => 296,
                'pressure' => 1015,
                'sea_level' => 1015,
                'grnd_level' => 1012,
                'humidity' => 46,
                'temp_kf' => -2.02
              },
              'weather' => [
                {
                  'id' => 800,
                  'main' => 'Clear',
                  'description' => 'clear
                  sky',
                  'icon' => '01n'
                }
              ],
              'clouds' => {
                'all' => 1
              },
              'wind' => {
                'speed' => 2.18,
                'deg' => 216
              },
              'visibility' => 10000,
              'pop' => 0,
              'sys' => {
                'pod' => 'n'
              },
              'dt_txt' => '2020-10-05 06:00:00'
            }
          ]
        }
      )
    end

    before do
      allow(HTTParty).to receive(:get).
        and_return(forecast_response)

      Petrel.configure do |c|
        c.api_key = 'mock_api_key'
      end
    end

    it 'returns the current weather' do
      expect(HTTParty).to receive(:get).
        with("#{Petrel.url}/forecast", query: {
          lat: 37,
          lon: -122,
          appid: Petrel.api_key
        }).
        and_return(forecast_response)

      Petrel.forecast(query)
    end
  end
end
