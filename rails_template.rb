gem "strong_migrations"
gem "sidekiq"
gem "sidekiq-status"
gem "sidekiq-failures"
gem "sidekiq-scheduler"
gem "redis"
gem "redis-namespace"
gem "sorbet-runtime"
gem "sorbet-rails"

gem_group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "pry-rails"
  gem "pry-doc"
  gem "pry-byebug"
  gem "factory_bot_rails"
end

gem_group :development do
  gem "sorbet"
  gem "web-console"
  gem "listen"
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "rubocop-rails"
  gem "bullet"
  gem "brakeman"
  gem "reek"
  gem "rails_best_practices"
  gem "solargraph"
  gem "rb-readline"
  gem "overcommit"
  gem "bundle-audit"
  gem "amazing_print"
end

gem_group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "capybara-screenshot"
  gem "simplecov", require: false
  gem "shoulda-matchers"
  gem "selenium-webdriver"
  gem "json-schema"
  gem "rails-controller-testing"
  gem "webmock"
  gem "email_spec"
  gem "timecop"
  gem "launchy"
  gem "rspec-sorbet"
  gem "rubocop-faker"
end

run "bundle install"

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end

generate "rspec:install"
generate "cucumber:install"
