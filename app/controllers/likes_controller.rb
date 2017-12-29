class LikesController < ApplicationController
  
  def create
    puts params
    Like.create!(restaurant_id: params[:restaurant_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def destroy
    puts "-------------"
    puts params
    like = Like.find_by("restaurant_id" => params[:restaurant_id])
    like.destroy
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
end
