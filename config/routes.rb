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
  resources :carts, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  # 配送先テーブル
  resources :delivers

<<<<<<< HEAD
  namespace :admins do
    resources :orders, only: [:update]
=======
  namespace :admin do
    resources :orders, only: [:update, :index, :show] #index,showに遷移させたい為追加しました。
>>>>>>> b03b74783303f2e5923f471d4d33bc3325c8c7df
    resources :genres
    resources :items
  end

<<<<<<< HEAD
  resources :carts, only: [:show]
=======
  # 注文テーブル
  resources :orders
  
  resources :carts, only: [:show] 
>>>>>>> b03b74783303f2e5923f471d4d33bc3325c8c7df
   post '/add_item' => 'carts#add_item'
   post '/update_item' => 'carts#update_item'
   delete '/delete_item' => 'carts#delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
