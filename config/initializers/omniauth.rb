Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['github_key'] , ENV['github_secrets']
end