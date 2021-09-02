Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :venues, only: [:index, :show] do
    resources :bookings, only: [:new, :index, :create]
    resources :reviews, only: [:new]
  end

  resources :users, only: [:index] do
    resources :chatrooms, only: [:index]
  end

  resources :chatrooms, only: [:new, :show] do
    resources :messages, only: [:new]
  end

  resources :tours, only: [:new, :show, :index] do
    resources :bookings, only: [:show, :index]
  end
end
