Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  get 'aboutus', to: "pages#aboutus", as: :aboutus
end
