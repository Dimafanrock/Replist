source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "bootsnap", require: false
gem 'graphql-client'

group :development, :test do 
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
    end
end

group :development do

end

