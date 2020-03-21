Rails.application.routes.draw do

  # 管理者のログイン・トップページを顧客と分ける為のもの
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_scope :admin do
    get '/admins/top' => 'admins/registrations#top'
  end

  # 顧客テーブル
  devise_for :customers
  get '/customers/withdraw' => 'customers#withdraw'
  resources :customers, only: [:show, :edit, :update]

  # 商品テーブル
  root to: 'items#top'
  resources :items, only: [:index, :show]
  resources :carts, only: [:index,:destroy]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item/:item_id' => 'carts#delete_item', as: 'delete_item'

  # 配送先テーブル
  resources :delivers

  namespace :admin do
    resources :orders, only: [:update]
    resources :genres
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
