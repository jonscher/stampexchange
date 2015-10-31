Rails.application.routes.draw do

  devise_for :users
  resources :listings

  root 'listings#index'
  get 'pages/about'

  get 'pages/home'
  get 'seller' => "listings#seller"
  get 'pages/contact'
  get 'pages/about'
  get 'session/new'


  resources :messages, only: [:new, :create]


  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end


  namespace :admin do
    resources :users, only: :show do
      post :generate_new_password_email
    end
  end
end
