class BlacklistUsersController < ApplicationController
  def edit
    @blacklist_user = BlacklistUser.new
  end
end
