class Admin::RestaurantsController < Admin::BaseController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(8)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path
      flash[:notice] = "restaurant was successfully updated"
    else
      render :edit
      flash[:alert] = "restaurant was failed to update"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was delete"
  end
  
  def favorites
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorites = @restaurant.favorites
  end
  
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
  def restaurant_params
    params.
      require(:restaurant).
      permit(:name, 
        :opening_hours, 
        :tel,
        :address,
        :description,
        :image,
        :category_id)
  end

end
