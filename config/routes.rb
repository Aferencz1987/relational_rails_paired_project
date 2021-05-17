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
  get '/manufacturers/new', to: 'manufacturers#new'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/guitars', to: 'manufacturers#inventory'
  get '/manufacturers/:id/guitars/new', to: 'manufacturers#new_guitar'
  post '/manufacturers/:id/guitars', to: 'manufacturers#create_guitar'
  post '/manufacturers/', to: 'manufacturers#create'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  get '/guitars', to: 'guitars#index'
  get '/guitars/:id', to: 'guitars#show'
end
