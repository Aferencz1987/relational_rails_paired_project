Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/stores', to: 'stores#index'
  get '/stores/new', to: 'stores#new'
  post '/stores', to: 'stores#create'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
end
