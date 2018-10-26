Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	resources :categories do
  		resources :words
  	end
  	resources :choices
  end

resources :lessons do
	resources :answers
end

resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :relationships, only:[:create, :destroy]
resources :categories



root 'static_pages#home'

end
