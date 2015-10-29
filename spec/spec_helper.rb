RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def user
    @user ||= User.new(provider: 'github',
                       uid: '15368238',
                       email: nil,
                       nickname: '1507GitCommitTest',
                       image_url: "https://avatars.githubusercontent.com/u/15368238?v...",
                       token: '891bef4db51f9526e0cbd4d82c1a1fe09a15cd6e')
  end
end
