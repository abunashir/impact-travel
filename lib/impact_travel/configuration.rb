module ImpactTravel
  class Configuration
    attr_accessor :api_key, :logo, :logo_inverse, :title, :abbreviation
    attr_accessor :stylesheet, :keywords, :description, :author, :phone
    attr_accessor :domain, :facebook, :twitter, :instagram, :slides
    attr_accessor :country, :address

    def initialize
      @domain ||= "discountnetwork.io"
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
