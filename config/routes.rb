Rails.application.routes.draw do
  devise_for :users
    get 'home', to: 'pages#home'

    root to: 'pages#home'
end
