Rails.application.routes.draw do
  get '/bookings', to: 'bookings#new'

  root 'flights#index'
  resources :flights, only: [:index]
end
