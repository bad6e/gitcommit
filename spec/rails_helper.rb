ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require "capybara/rspec"
require 'vcr'
require 'webmock/rspec'

OmniAuth.config.test_mode = true
   omniauth_hash = { 'provider' => 'github',
                      'uid' => '12345',
                      'info' => {
                          'name' => 'bret',
                          'email' => 'bret@iscool.com',
                          'nickname' => 'bad6e'
                      },

                      'credentials' => {
                          'token' => '123'
                      },

                      'extra' => {'raw_info' =>
                                      { 'location' => 'Planet Neptune',
                                        'gravatar_id' => '123456789'
                                      }
                      }
    }

OmniAuth.config.add_mock(:github, omniauth_hash)

def stat_one
  @stat_one = Stat.create(name: "Bret Doucette",
                commits: 100,
                streaks: 22,
                current_streaks: 7)
end

def stat_two
  @stat_two = Stat.create(name: "Bret Doucette1",
                commits: 102,
                streaks: 21,
                current_streaks: 8)
end

def test_setup
  stat_one
  stat_two
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
