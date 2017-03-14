Rails.application.routes.draw do
  # get 'properties/index'
  #
  # get 'properties/show'
  #
  # get 'properties/new'
  #
  # get 'properties/edit'

  get 'properties/listings', to: 'properties#listings', as: 'listings'

  resources :properties

  get 'shortlists/index'
  delete '/shortlists/:id', to: 'shortlists#destroy', as: 'remove_shortlists'
  post 'shortlists', to:'shortlists#create'

  # resources :shortlists
  # delete 'shortlists/:id'

  # get 'static/homepage'

  devise_for :users, controllers: { registrations: "users/registrations" }
#To create custom route in devise, we need to play by devise's rules and wrap the route in devise scope
  # devise_scope :user do
  #   get 'users/listings', to: 'users/registrations#listings', as: "user_listings"
  #
  # end


  root 'static#homepage'

end
