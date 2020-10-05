require 'spec_helper'

RSpec.describe Petrel do
  describe '.one_call' do
    let(:query) do
      {
        lat: 37,
        lon: -122
      }
    end

    let(:one_call_response) do
      double(
        code: 200,
        parsed_response: {
          'lat' => 37,
          'lon' => -122,
          'timezone' => 'America/Los_Angeles',
          'timezone_offset' => -25200,
          'current' => {
            'dt' => 1601879386,
            'sunrise' => 1601820377,
            'sunset' => 1601862390,
            'temp' => 290.77,
            'feels_like' => 292.82,
            'pressure' => 1016,
            'humidity' => 100,
            'dew_point' => 290.77,
            'uvi' => 5.78,
            'clouds' => 1,
            'visibility' => 10000,
            'wind_speed' => 0.84,
            'wind_deg' => 358,
            'weather' => [
              {
                'id' => 800,
                'main' => 'Clear',
                'description' => 'clear sky',
                'icon' => '01n'
              }
            ]
          },
          'minutely' => [
            { 'dt'=>1601879400, 'precipitation'=>0 }
          ],
          'hourly' => [
            {
              'dt' => 1601877600,
              'temp' => 290.77,
              'feels_like' => 292.82,
              'pressure' => 1016,
              'humidity' => 100,
              'dew_point' => 290.77,
              'clouds' => 1,
              'visibility' => 10000,
              'wind_speed' => 0.84,
              'wind_deg' => 358,
              'weather' => [
                {
                  'id' => 800,
                  'main' => 'Clear',
                  'description' => 'clear sky',
                  'icon' => '01n'
                }
              ],
              'pop' => 0
            }
          ],
          'daily' => [
            {
              'dt' => 1601838000,
              'sunrise' => 1601820377,
              'sunset' => 1601862390,
              'temp' => {
                'day' => 299.37,
                'min' => 290.77,
                'max' => 302.77,
                'night' => 290.77,
                'eve' => 301.85,
                'morn' => 293.12
              },
              'feels_like' => {'day' => 297.62,
              'night' => 292.82,
              'eve' => 300.06, 'morn' => 291.88},
              'pressure' => 1016,
              'humidity' => 29,
              'dew_point' => 280.09,
              'wind_speed' => 1.43,
              'wind_deg' => 264,
              'weather' => [
                {
                  'id' => 800,
                  'main' => 'Clear',
                  'description' => 'clear sky', 'icon' => '01d'
                }
              ],
              'clouds' => 0,
              'pop' => 0,
              'uvi' => 5.78
            }
          ]
        }
      )
    end

    before do
      allow(HTTParty).to receive(:get).
        and_return(one_call_response)

      Petrel.configure do |c|
        c.api_key = 'mock_api_key'
      end
    end

    it 'returns the current weather' do
      expect(HTTParty).to receive(:get).
        with("#{Petrel.url}/onecall", query: {
          lat: 37,
          lon: -122,
          appid: Petrel.api_key
        }).
        and_return(one_call_response)

      Petrel.one_call(query)
    end
  end
end
