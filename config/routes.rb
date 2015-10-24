Rails.application.routes.draw do
  get  '/dashboard', to: 'dashboard#show'

  get    "/auth/github/callback", to: "sessions#create"
  get    "/auth/github",          as: :login
  delete "/logout",                 to: "sessions#destroy"

  root "stats#index"
end
