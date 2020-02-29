Rails.application.routes.draw do
  post 'blacklist_users/create'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: "pages#dashboard", as: :dashboard

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blacklists, only: [ :index ]
      resources :flashcards, only: [ :index, :show, :update ]
    end
  end
end
