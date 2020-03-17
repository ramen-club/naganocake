Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers

  root to: 'items#top'
  resources :items, only: [:index, :show]

  resources :customers, only: [:show, :edit, :update]

  namespace :admin do
    resources :orders, only: [:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
