Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers

  root to: 'items#top'
  resources :items, only: [:index, :show]
  resources :carts, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  resources :customers, only: [:show, :edit, :update]
  get '/customers/withdraw' => 'customers#withdraw'

  namespace :admin do
    resources :orders, only: [:update]
  end
  
   resources :carts, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
