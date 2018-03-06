Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'avatars'}
    get 'home', to: 'pages#home'
    get 'about-us', to: 'pages#about_us'
    resources :users, only: [:show]

    root to: 'pages#home'

    mount ActionCable.server => '/cable'
end
