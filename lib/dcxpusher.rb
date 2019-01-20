require "dcxpusher/version"
require "dcxpusher/external"
require "dcxpusher/internal"

module Dcxpusher
  include External
  include Internal

  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :base_url, :key, :secret
  end
end