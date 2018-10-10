$:.push File.expand_path("../lib", __FILE__)
require "impact_travel/version"

Gem::Specification.new do |s|
  s.name        = "impact_travel"
  s.version     = ImpactTravel::VERSION
  s.authors     = ["Abu Nashir"]
  s.email       = ["abunashir@gmail.com"]
  s.homepage    = "https://github.com/impactservices/impact-travel"
  s.summary     = "Impact Travel Engine"
  s.description = "Impact TraveL Engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = `git ls-files -- {spec}/*`.split("\n")

  s.add_dependency "bootstrap-sass", "~> 3.3.7"
  s.add_dependency "coffee-rails"
  s.add_dependency "country_select"
  s.add_dependency "discountnetwork", "~> 0.1.1"
  s.add_dependency "font-awesome-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "rails", ">= 5.0.0"
  s.add_dependency "sass-rails"
  s.add_dependency "simple_form"
  s.add_dependency "will_paginate", "~> 3.0.6"

  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "shoulda-matchers", "~> 3.1"
  s.add_development_dependency "webmock", "~> 2.0"
end
