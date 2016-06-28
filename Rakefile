require "rubygems"
require "bundler/setup"
require "bundler/gem_tasks"

require "rake"
require "rspec/core/rake_task"

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load "rails/tasks/engine.rake"
load "rails/tasks/statistics.rake"

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec)

desc "Run the specs and acceptance tests"
task :default => :spec

