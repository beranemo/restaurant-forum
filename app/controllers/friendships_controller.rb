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
新增 Active Record Models (e.g. rails generate model)
可以遷移資料庫並留下紀錄 (Migration)
對 Model 的資料進行新增、讀取、修改、刪除等操作
在資料存入資料庫前進行資料驗證
在資料 CRUD 週期中呼叫特定程式碼
設定並操作 Models 間的關聯 (e.g. has_many, belongs_to)