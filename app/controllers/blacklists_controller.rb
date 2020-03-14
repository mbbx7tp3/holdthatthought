class BlacklistsController < ApplicationController


  def destroy
    @blacklist = Blacklist.find(params[:id])
    @blacklist.destroy
    redirect_to dashboard_path
  end


  def create
    @blacklist = Blacklist.new(blacklist_params)
    @user = current_user
    @blacklist.save
    redirect_to dashboard_path
  end



  private

  def blacklist_params
    params.require(:blacklist).permit(:website_name, :website_url, :image_url)
  end

end
