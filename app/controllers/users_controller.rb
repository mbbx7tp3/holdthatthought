class UsersController < ApplicationController
  def update
    @user = current_user
    @blacklist_ids = params["user"]["blacklist_ids"].drop(1)

    @blacklist_ids.each do |blacklist_id|
      BlacklistUser.create(user: @user, blacklist: Blacklist.find(blacklist_id.to_i))
    end

    # @user.update(Hash[@blacklist_ids])
    # @user.update(blacklist_ids: @blacklist_ids)
    # @user = current_user
    # @user.update(blacklist_ids: [ "3" ])

    raise

  end
end
