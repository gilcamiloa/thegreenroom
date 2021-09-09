Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :bookings, only: [:index, :show]
  resources :venues, only: [:index, :show, :new, :create] do
    resources :bookings, only: [ :new, :create, :index]
    resources :reviews, only: [:new]
  end
    resources :bookings, only: [] do
      member do
        patch :accept
        patch :reject
      end
    end

  resources :users, only: [:index, :edit, :update, :show] do
    resources :chatrooms, only: [:index]
  end

  resources :chatrooms, only: [:new, :show] do
    resources :messages, only: [:new]
  end

  resources :tours, except: :destroy do
    resources :bookings, only: [:show]
  end
end
