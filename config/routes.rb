Rails.application.routes.draw do
  # get 'static/homepage'

  devise_for :users
  # get 'property/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'properties#index'
  root 'static#homepage'
end
