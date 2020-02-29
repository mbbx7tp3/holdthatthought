Rails.application.routes.draw do
  patch 'users/update'
  post 'blacklist_users/create'
  get 'blacklist_users/edit'
  get 'blacklist_users/learn'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: "pages#dashboard", as: :dashboard

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blacklists, only: [ :index ]
      resources :flashcards, only: [ :index, :show, :update ]
    end
  end
  
  get 'test', to: "pages#test", as: :test
end
