Rails.application.routes.draw do
  namespace :api do
    resources :matches, only: [:index]
    get "leaderboard", to: "leaderboard#index"
  end
end