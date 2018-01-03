class FollowshipsController < ApplicationController
  
  def create
    @followship = current_user.followships.build(following_id: params[:following_id])
    
    if @followship.save
      flash[:notice] = "追蹤成功"
      redirect_back(fallback_location: root_path)  # 導回上一頁
    else
      flash[:alert] = @followship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)  # 導回上一頁
    end
  end
  
end
