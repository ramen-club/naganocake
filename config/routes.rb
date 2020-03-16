Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :customers

  resources :items, only: [:index, :show]

  namespace :admin do
    resources :orders, only: [:製作ステータスを変えるアクション名]
  end

  get '/items/top', to: 'items#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
