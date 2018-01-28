class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    
    if @friendship.save
      flash[:notice] = "交友邀請已送出"
      redirect_back(fallback_location: root_path)  # 導回上一頁
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)  # 導回上一頁
    end
  end
  
  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    if @friendship
      @friendship.destroy
      flash[:notice] = "取消邀請"
      redirect_back(fallback_location: root_path)  # 導回上一頁
    end
  end
   
  def reject
    @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    if @friendship
      @friendship.destroy
      flash[:notice] = "拒絕好友邀請"
      redirect_back(fallback_location: root_path)  # 導回上一頁
    end
  end
  
  def accept
    @friendship = current_user.friendships.build(friend_id: params[:id])
    if @friendship.save
      flash[:notice] = "接受好友邀請"
      redirect_back(fallback_location: root_path)  # 導回上一頁
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
    end
  end
  
end
