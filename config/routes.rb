Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :venues, only: [:index, :show, :new, :create] do
    resources :bookings, only: [ :new, :create, :index, :show ]
    resources :reviews, only: [:new]
  end

  resources :users, only: [:index] do
    resources :chatrooms, only: [:index]
  end

  resources :chatrooms, only: [:new, :show] do
    resources :messages, only: [:new]
  end

  resources :tours, only: [:new, :create, :show, :index] do
    resources :bookings, only: [:show]
  end
  resources :bookings, only: [:index]
end
