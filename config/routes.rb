Rails.application.routes.draw do

  namespace :admin do
    get 'order_details/edit'
    get 'order_details/index'
  end
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
  resources :customers, only: [:show, :edit, :update] do
    collection do
      patch 'active'
    end
  end
  namespace :admin do
    resources :customers
  end

  # 商品テーブル
  root to: 'items#top'
  resources :items, only: [:index, :show], param: :id
  resources :carts, only: [:index,:destroy]
  post '/add_item' => 'carts#add_item'
  patch '/carts/:cart_item_id' => 'carts#update_item', as: 'update_item'
  delete '/delete_item/:cart_item_id' => 'carts#delete_item', as: 'delete_item'

  # 配送先テーブル
  resources :delivers


  namespace :admin do
    #admin側のorderテーブル
    resources :orders, only: [:update, :index, :show] #index,showに遷移させたい為追加しました。
    resources :order_details, only: [:update, :index]
    resources :genres
    resources :items
  end
  # 注文テーブル

  # resources :orders
  resources :orders
   get '/orders/thankyou' => 'orders#thankyou'
  #  get '/thankyou' => ''
  resources :carts, only: [:show]
   post '/add_item' => 'carts#add_item'
   post '/update_item' => 'carts#update_item'
   delete '/delete_item' => 'carts#delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
