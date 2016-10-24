Rails.application.routes.draw do
  root 'flights#index'
  get '/bookings', to: 'bookings#new'
  resources :flights, only: [:index, :show]
  resources :bookings, only: [:new, :create, :show]
end
