class BlacklistUsersController < ApplicationController
  def create
    @user = current_user
    arr = params[:blacklist_user][:blacklist].select { |id| !id.blank? }
    arr.each do |i|
      new_blacklist = Blacklist.find(i.to_i)
      BlacklistUser.create(user: @user, blacklist: new_blacklist)
    end
  end

  def edit
  @user = current_user
  end

  def learn
  @user = current_user
  end

end
