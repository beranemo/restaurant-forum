Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :restaurants, only: [:index, :show] do
    
    resources :comments, only: [:create, :destroy]
    
    collection do
      # 瀏覽所有餐廳的最近動態
      get :feeds
      
      # TOP 10 餐廳
      get :ranking
    end
    
    # 瀏覽個別餐廳的 Dashboard
    member do
      get :dashboard
    end
    
    # 比較[收藏／取消收藏]、[喜翻／收回喜翻]這兩種不同的寫法
    
    member do
      # 收藏／取消收藏
      post :favorite
      post :unfavorite
      delete :unfavorite2
    end
    
    # 喜翻／收回喜翻
    resources :likes, only: [:create, :destroy]
    # 上面的這個寫法其實就是跟 comment 一樣的東西
    
  end
  resources :categories, only: [:show]
  
  resources :users, only: [:show, :edit, :update, :index]
  
  # 追蹤／取消追蹤
  resources :followships, only: [:create, :destroy]
  
  # 好友邀請／取消邀請
  resources :followships, only: [:create, :destroy]
  
  root 'restaurants#index'
  
  namespace :admin, path: "c7edcc" do
    resources :restaurants do
      # 瀏覽所有收藏者
      get :favorites
    end  
    resources :categories
    root 'restaurants#index'
  end
  
  resources :repos
  
end