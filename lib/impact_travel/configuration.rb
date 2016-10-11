module ImpactTravel
  class Configuration
    attr_accessor :api_key, :logo
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end
end
