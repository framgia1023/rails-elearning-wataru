Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users
resources :sessions, only: [:new, :create, :destroy]
root 'static_pages#home'

end
