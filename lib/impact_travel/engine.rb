module ImpactTravel
  class Engine < ::Rails::Engine
    isolate_namespace ImpactTravel

    config.after_initialize do
      DiscountNetwork.configure do |dn_config|
        dn_config.api_key = ImpactTravel.configuration.api_key
      end
    end

    initializer "impact_travel.assets.precompile" do |app|
      app.config.assets.precompile += %w(impact_travel/**)
      app.config.assets.precompile += %w(vendor/assets/**/**)
    end
  end
end
