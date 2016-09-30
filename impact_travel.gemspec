$:.push File.expand_path("../lib", __FILE__)
require "impact_travel/version"

Gem::Specification.new do |s|
  s.name        = "impact-travel"
  s.version     = ImpactTravel::VERSION
  s.authors     = ["Abu Nashir"]
  s.email       = ["abunashir@gmail.com"]
  s.homepage    = "https://github.com/impactservices/impact-travel"
  s.summary     = "Impact Travel Engine"
  s.description = "Impact TraveL Engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = `git ls-files -- {spec}/*`.split("\n")

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "webmock", "~> 2.0"
end
