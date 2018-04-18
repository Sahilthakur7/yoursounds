Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'avatars'}
    get 'home', to: 'pages#home'
    get 'about-us', to: 'pages#about_us'
    resources :users, only: [:show]

    root to: 'pages#home'

    mount ActionCable.server => '/cable'
    get 'auth/:provider/callback',to: 'sessions#create'
    match 'auth/failure', to: redirect('/')
    match 'signout', to: 'sessions#destroy', as: 'signout'
end
