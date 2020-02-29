Rails.application.routes.draw do
  patch 'users/update'
  post 'blacklist_users/create'
  get 'blacklist_users/edit'
  get 'blacklist_users/learn'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  get "payment" , to: "pages#payment", as: :payment
end
