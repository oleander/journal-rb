# Load the rails application
APP_CONFIG = YAML.load_file "#{Rails.root}/config/config.yml"

require File.expand_path('../application', __FILE__)

# Initialize the rails application
Journal::Application.initialize!
