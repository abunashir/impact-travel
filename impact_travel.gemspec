$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "impact_travel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "impact_travel"
  s.version     = ImpactTravel::VERSION
  s.authors     = ["Abu Nashir"]
  s.email       = ["abunashir@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ImpactTravel."
  s.description = "TODO: Description of ImpactTravel."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
