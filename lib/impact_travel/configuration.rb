module ImpactTravel
  class Configuration
    attr_accessor :api_key, :logo, :logo_inverse, :title, :abbreviation
    attr_accessor :stylesheet, :keywords, :description, :author, :phone
    attr_accessor :facebook, :twitter, :instagram, :slides

    def initialize
      @slides ||= ["impact_travel/slide.jpg"]
    end
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
