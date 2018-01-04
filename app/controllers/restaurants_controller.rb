class RestaurantsController < ApplicationController
  
  impressionist :actions => [:show]

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
    impressionist(@restaurant, "message...") # 2nd argument is optional
  end
  
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end
  
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end
  
  # POST /restaurants/:id/favorite(.:format)
  def favorite
    restaurant = Restaurant.find(params[:id])
    restaurant.favorites.create!(user: current_user)
    restaurant.count_favorites
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def unfavorite
    restaurant = Restaurant.find(params[:id])
    favorite = Favorite.find_by("restaurant_id" => restaurant.id, "user_id" => current_user.id)
    restaurant.count_favorites
    favorite.destroy
    
    # 下面這樣寫法也是可以的
    # favorite = Favorite.where(restaurant: @restaurant, user: current_user)
    # favorite.destroy_all
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def ranking
    @restaurants = Restaurant.order(favorites_count: :desc).limit(10)
  end
  
  def favorites
    @restaurant = Restaurant.find(params[:id])
    @favorites = @restaurant.favorites
  end
  
end
