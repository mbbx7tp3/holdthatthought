class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      @user = current_user
    else
      @user = User.new
    end
    @blacklist_user = BlacklistUser.new
    @blacklist_options = Blacklist.all
  end

  def dashboard
    @user = current_user
  end
end
