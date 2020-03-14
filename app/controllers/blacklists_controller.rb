class BlacklistsController < ApplicationController


  def destroy
    @blacklist = Blacklist.find(params[:id])
    @blacklist.destroy
    redirect_to dashboard_path
  end
end
