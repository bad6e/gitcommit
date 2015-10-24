Rails.application.routes.draw do
  get  '/dashboard', to: 'dashboard#show'

  get "/auth/github/callback", to: "sessions#create"
  get "/auth/github", as: :login

  root "stats#index"
end
