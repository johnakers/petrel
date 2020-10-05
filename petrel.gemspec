$LOAD_PATH.push(File.expand_path('../lib', __FILE__))

require 'petrel/version'

Gem::Specification.new do |s|
  s.name        = 'petrel'
  s.version     = Petrel::VERSION
  s.authors     = ['John Akers']
  s.homepage    = 'https://github.com/johnakers/petrel'
  s.summary     = "RubyGem for OpenWeatherMap's current weather"
  s.description = 'RubyGem wrapper for openweathermap.org'
  s.licenses    = ['MIT']
  s.require_paths = ['lib']

  #
  s.add_dependency('httparty', '~> 0.18.1')

  #
  s.add_development_dependency('awesome_print', '~> 1.8.0')
  s.add_development_dependency('rspec', '~> 3.9.0')
  s.add_development_dependency('pry', '~> 0.13.1')

  # files
  s.files = `git ls-files`.split("\n")

  # Remove this line for no squawking
  s.post_install_message = '*squawk* *squawk* Thanks for using Petrel - John'
end
