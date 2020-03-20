class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:photo)
  end

  def update
    @user = current_user
    @blacklist_ids = params["user"]["blacklist_ids"].drop(1)

    @blacklist_ids.each do |blacklist_id|
      BlacklistUser.create(user: @user, blacklist: Blacklist.find(blacklist_id.to_i))
    end

    if @user.save
      redirect_to dashboard_path
      return
    end
  end

  def options
    @user = current_user
  end
end
