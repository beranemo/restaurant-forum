class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants.uniq
  end
  
  def edit
    @user = User.find(params[:id])
    
    unless @user.id == current_user.id
      flash[:notice] = "你沒有權限";
      redirect_to user_path(@user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "user was successfully updated"
    else
      render :edit
      flash[:alert] = "user was failed to update"
    end
  end
  
  private
  
  def user_params
    params.
      require(:user).
      permit(:name, 
        :intro, 
        :avatar)
  end
end
