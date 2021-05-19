Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/stores', to: 'stores#index'
  get '/stores/new', to: 'stores#new'
  post '/stores', to: 'stores#create'
  get '/stores/:id', to: 'stores#show'
  get '/stores/:id/tools/new', to: 'stores#new_tool'
  get '/stores/:id/tools', to: 'stores#inventory'
  get '/stores/:id/tools/:sort', to: 'stores#inventory'
  get 'stores/:id/edit', to: 'stores#edit'
  patch '/stores/:id', to: 'stores#update'
  get '/tools', to: 'tools#index'
  get '/tools/:id', to: 'tools#show'
  delete '/stores/:id/tools/:id', to: 'tools#destroy'
  get '/tools/:id/edit', to: 'tools#edit'
  patch '/tools/:id', to: 'tools#update'
  post '/stores/:id/tools', to: 'stores#create_tool'
  delete '/stores/:id', to: 'stores#destroy'

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/guitars', to: 'manufacturers#inventory'
  get '/manufacturers/:id/guitars/new', to: 'manufacturers#new_guitar'
  get '/manufacturers/:id/guitars/:sort', to: 'manufacturers#inventory'
  post '/manufacturers/:id/guitars', to: 'manufacturers#create_guitar'
  post '/manufacturers/', to: 'manufacturers#create'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  delete '/manufacturers/:id', to: 'manufacturers#delete'
  get '/guitars', to: 'guitars#index'
  get '/guitars/:id', to: 'guitars#show'
  delete '/guitars', to: 'guitars#delete'
  get '/guitars/:id/edit', to: 'guitars#edit'
  patch '/guitars/:id', to: 'guitars#create'
end
