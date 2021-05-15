Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/stores', to: 'stores#index'
  get '/stores/new', to: 'stores#new'
  post '/stores', to: 'stores#create'
  get '/stores/:id', to: 'stores#show'
  get '/stores/:id/tools', to: 'stores#inventory'
  get 'stores/:id/edit', to: 'stores#edit'
  patch '/stores/:id', to: 'stores#update'
  get '/tools', to: 'tools#index'
  get '/tools/:id', to: 'tools#show'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/guitars', to: 'manufacturers#inventory'
  get '/guitars', to: 'guitars#index'
  get '/guitars/:id', to: 'guitars#show'
end
