Rails.application.routes.draw do
  root to: 'pages#home'

  post 'blacklist_users/create'
  get 'blacklist_users/edit'
  get 'blacklist_users/learn'
  delete 'blacklist_users/destroy'

  devise_for :users
  get 'users/options'
  patch 'users/update'

  get 'dashboard', to: "pages#dashboard", as: :dashboard
  get 'blockedwebsite', to: 'pages#blockedwebsite', as: :blockedwebsite
  get 'forms', to: "pages#forms", as: :forms
  get 'plans/index'
  resources :flashcards, only: [:show]
  resources :flashcard_users, only: [:create]
  resources :blacklists, only: [:destroy, :create]



  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'login_return_token', to: 'tokens#login_return_token'
      resources :blacklists, only: [ :index ]
      patch 'blacklists/create', to: 'blacklists#create'
      post 'blacklists/signup', to: 'blacklists#signup'
      resources :flashcards, only: [ :index, :show, :update ]
    end
  end

end
