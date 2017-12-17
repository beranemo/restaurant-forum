class CommentsController < ApplicationController
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if current_user.admin?
      @comment.destroy
      @restaurant = Restaurant.find(params[:restaurant_id])
      redirect_to restaurant_path(@restaurant)
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
