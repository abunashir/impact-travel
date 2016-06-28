$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "impact_travel/version"

# Describe your gem and declare its dependencies:
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
end
