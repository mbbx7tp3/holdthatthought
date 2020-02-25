Rails.application.routes.draw do
  post 'blacklist_users/create'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: "pages#dashboard", as: :dashboard
end
