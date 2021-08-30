Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/index'
  devise_for :users
  root to: 'pages#home'
  resources :venues, only: [:index, :show] do
    resources :bookings, only: [:new, :index]
    resources :reviews, only: [:new]
  end

  resources :users, only: [:index] do
    resources :chatrooms, only: [:index]
  end

  resources :chatrooms, only: [:new, :show] do
    resources :messages, only: [:new]
  end

  resources :tours, only: [:new, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
