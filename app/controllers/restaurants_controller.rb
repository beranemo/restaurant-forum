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
  
end
