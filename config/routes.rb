Rails.application.routes.draw do
  # get 'static/homepage'

  devise_for :users, controllers: { registrations: "users/registrations" }

  # get 'property/index'

  root 'static#homepage'

end
