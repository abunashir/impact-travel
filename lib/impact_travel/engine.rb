module ImpactTravel
  class Engine < ::Rails::Engine
    isolate_namespace ImpactTravel

    config.after_initialize do
      DiscountNetwork.configure do |dn_config|
        dn_config.api_key = ImpactTravel.configuration.api_key
      end
    end
  end
end
