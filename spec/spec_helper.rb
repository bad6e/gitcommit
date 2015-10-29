require 'simplecov'
SimpleCov.start 'rails'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def user
    @user ||= User.new(provider: 'github',
                       uid: ENV['user'],
                       email: nil,
                       nickname: '1507GitCommitTest',
                       image_url: "https://avatars.githubusercontent.com/u/15368238?v...",
                       token: ENV['user_token'])
  end
end
