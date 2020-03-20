class BlacklistsController < ApplicationController
  def destroy
    @user = current_user
    @blacklist = Blacklist.find(params[:id])
    blacklist_user = BlacklistUser.find_by(user: @user, blacklist: @blacklist)
    blacklist_user.destroy
    redirect_to dashboard_path
  end

  def create
    @user = current_user
    @blacklist = Blacklist.new(blacklist_params)
    @blacklistUser = BlacklistUser.create(user: @user, blacklist: @blacklist)
    @blacklistUser.save
    redirect_to dashboard_path
  end

  private

  def blacklist_params
    params.require(:blacklist).permit(:website_name, :website_url, :image_url)
  end
end
