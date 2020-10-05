# Petrel

A RubyGem wrapp for [OpenWeatherMap's Free API]((https://openweathermap.org/appid))

### Installation

```rb
gem install petrel
```

or in your Gemfile...

```rb
gem 'petrel'
```

### Configuration

You will need to set your OpenWeather `api_key`  before making requests. You can get one [here](https://home.openweathermap.org/users/sign_up).

```rb
Petrel.configure do |c|
  c.api_key = 'YOUR_API_KEY'
end
```

Alternatively, you can do:

```rb
Petrel.api_token = 'YOUR_API_TOKEN'
```

### Usage / Examples

Once configured, you have access to the below methods. They correspond to the available endpoints, listed on OpenWeatherMap's API.

```rb
# 5 day / 3 hour forecast data
query = { q: 'San Francisco' }
Petrel.forecat(query)

# One Call
query = { lat: 37, lon: -122 }
Petrel.one_call(query)

# Current weather
query = { lat: 37, lon: -122 }
Petrel.weather(query)
```

Full documentation on what can be in `query` can be found in OpenWeatherMap's API documentation [here](https://openweathermap.org/api).
