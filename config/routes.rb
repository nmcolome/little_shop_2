Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'merchants#index'

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
  get '/items/:id/edit', to: 'items#edit'
  patch '/items/:id', to: 'items#update'
  patch '/items/:id/activate', to: 'items#update'
  patch '/items/:id/deactivate', to: 'items#update'
  delete '/items/:id', to: 'items#destroy'
  get '/items/:id/reviews/new', to: 'reviews#new'
  post '/items/:id/reviews', to: 'reviews#create'
  get '/items/:id/reviews/:review_id/edit', to: 'reviews#edit'
  patch '/items/:id/reviews/:review_id', to: 'reviews#update'

  get '/merchants/:merchant_id/items', to: 'items#index'
  get '/merchants/:merchant_id/items/new', to: 'items#new'
  post '/merchants/:merchant_id/items', to: 'items#create'
end
