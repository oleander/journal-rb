require "rubygems"
require "spork"
require "spork/ext/ruby-debug"
require "capybara/rails"
require "database_cleaner"

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path("../../config/environment", __FILE__)
  require "rspec/rails"
  require "rspec/autorun"

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.before(:suite) { DatabaseCleaner.strategy = :truncation }
    config.before(:each) { DatabaseCleaner.start }
    config.after(:each) { DatabaseCleaner.clean }
    config.infer_base_class_for_anonymous_controllers = false
  end
end

Spork.each_run do
end