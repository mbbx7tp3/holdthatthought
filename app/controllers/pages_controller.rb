class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    if current_user
      @user = current_user
    else
      @user = User.new
    end
  end

  def dashboard
    @user = current_user
    @blacklists = @user.blacklists
    @blacklist = Blacklist.new
    @learning_topic = @user.interest
  end

  def forms
    @user = current_user
  end

  def blockedwebsite
    @user = current_user
    @blacklists = @user.blacklists
    @blacklist = Blacklist.new
  end

  def payment
    @user = current_user
  end
end
