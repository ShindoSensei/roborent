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
  delete '/shortlists/:id', to: 'shortlists#destroy'
  post 'shortlists', to:'shortlists#create'
  post '/properties/:id', to: 'properties#contact_owner', as: 'contact_owner'


  # resources :shortlists
  # delete 'shortlists/:id'

  # get 'static/homepage'
  devise_for :users, controllers: { registrations: "users/registrations" }

  root 'static#homepage'

end
