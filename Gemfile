source "https://rubygems.org"

gem "rails", "~> 3.2.1"

# DB
gem "mysql"#, "0.3.7"

# View
gem "haml"
gem "sass"
gem "kaminari"
gem "maruku"
gem "wicked_pdf", git: "git://github.com/mileszs/wicked_pdf.git"
gem "simple_form"
gem "sass-rails",   "~> 3.2.3"
gem "coffee-rails", "~> 3.2.0"
gem "uglifier", ">= 1.0.3"
gem "jquery-rails"
# gem "activemodel"
gem "capistrano"
gem "uuid"
gem "rack", git: "https://github.com/rack/rack.git", ref: "e20baec005238f9876281c0d083fe5a4e01aa034" 

# Authentication
gem "omniauth-google"
gem "omniauth", "~> 1.0.1", git: "git://github.com/intridea/omniauth.git"

group :development, :test do
  gem "ruby-debug19", require: "ruby-debug"
  gem "sqlite3"
  gem "foreman"
end

group :test do
  gem "rspec"
  gem "capybara"
  gem "launchy"
  gem "selenium"
  gem "rspec-rails"
  gem "spork", "0.9.0"
  gem "guard-spork"
  gem "database_cleaner"
end