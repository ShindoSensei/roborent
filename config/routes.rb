Rails.application.routes.draw do
  # get 'properties/index'
  #
  # get 'properties/show'
  #
  # get 'properties/new'
  #
  # get 'properties/edit'

  resources :properties

  get 'shortlists/index'
  delete '/shortlists/:id', to: 'shortlists#destroy'


  # resources :shortlists
  # delete 'shortlists/:id'

  # get 'static/homepage'
  devise_for :users, controllers: { registrations: "users/registrations" }

  root 'static#homepage'

end
