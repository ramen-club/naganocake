Rails.application.routes.draw do
  
  namespace :admin do
    get 'genres/new'
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'genres/delete'
  end
  devise_for :admins
  devise_for :customers

  root to: 'items#top'

  resources :items, only: [:index, :show]

  namespace :admin do
    resources :orders, only: [:update]
    resources :genres
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
