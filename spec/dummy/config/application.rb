require File.expand_path("../boot", __FILE__)
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
require "impact_travel"

module Dummy
  class Application < Rails::Application
  end
end
