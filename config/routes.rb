Rails.application.routes.draw do
  namespace :api do
  	get 'users', to: 'users#index'
  	get 'user/:id', to: 'users#show'
  	post 'user', to: 'users#create'
  	put 'user/:id', to: 'users#update'
  	delete 'user/:id', to: 'users#destroy'
  	get 'typeahead/:input', to:'typeahead#user_search'
  end
end
