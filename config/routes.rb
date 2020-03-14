Rails.application.routes.draw do
  patch 'users/update'
  post 'blacklist_users/create'
  get 'blacklist_users/edit'
  get 'blacklist_users/learn'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  get 'forms', to: "pages#forms", as: :forms
  get 'plans/index'
  resources :flashcards, only: [:show]
  resources :flashcard_users, only: [:create]
  resources :blacklists, only: [:destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'login_return_token', to: 'tokens#login_return_token'
      resources :blacklists, only: [ :index ]
      patch 'blacklists/create', to: 'blacklists#create'
      resources :flashcards, only: [ :index, :show, :update ]
    end
  end

end
