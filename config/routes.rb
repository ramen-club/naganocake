Rails.application.routes.draw do

  # 管理者のログイン、トップページを顧客と分ける為のもの
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_scope :admin do
    get '/admins/top' => 'admins/registrations#top'
  end

  devise_for :customers

  root to: 'items#top'
  resources :items, only: [:index, :show]

  get '/customers/withdraw' => 'customers#withdraw'
  resources :customers, only: [:show, :edit, :update]


  namespace :admin do
    resources :orders, only: [:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
