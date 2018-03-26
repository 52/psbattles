source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.3.4"

gem "rails",          "~> 5.1.5"
gem "puma",           "~> 3.7"
gem "sass-rails",     "~> 5.0"
gem "uglifier",       ">= 1.3.0"
gem "turbolinks",     "~> 5"
gem "jbuilder",       "~> 2.5"
gem "bootstrap",      "~> 4.0.0"
gem "friendly_id",    "~> 5.1.0"
gem "jquery-rails"
gem "devise"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3"
end

group :development do
  gem "web-console",           ">= 3.3.0"
  gem "listen",                ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rails-controller-testing", "1.0.2"
  gem "minitest-reporters",       "1.1.14"
end

group :production do
  gem "pg"
end
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
