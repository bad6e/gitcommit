Rails.application.routes.draw do
  get    "/auth/github/callback", to: "sessions#create"
  get    "/auth/github", as: :login
  delete "/logout",  to: "sessions#destroy"

  get  '/dashboard', to: 'dashboard#show'

  root "stats#index"
end
