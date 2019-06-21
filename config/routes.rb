Rails.application.routes.draw do
	resources :ordered_products
  	resources :products
  	resources :orders
  	devise_for :users, :controllers => { registrations: 'registrations'}
  	root 'products#index', as: 'home'
  	get '/profile', to: 'users#profile'

  	namespace :users do
  		resources :orders, only: [:index, :show]
  	end
end
