# files
require 'petrel/version'
require 'petrel/configuration'
require 'petrel/forecast'
require 'petrel/one_call'
require 'petrel/weather'

# gems
require 'httparty'

module Petrel
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
