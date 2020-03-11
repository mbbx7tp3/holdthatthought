class Api::V1::BlacklistsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @blacklists = policy_scope(Blacklist)
    authorize @blacklists

    user_email = request.env["HTTP_X_USER_EMAIL"]
    user = User.find_by(email: user_email)

    @blacklists = user.blacklists
  end

  def create
    user_email = request.env["HTTP_X_USER_EMAIL"]
    user = User.find_by(email: user_email)

    blacklist_id = request.env["HTTP_X_BLACKLIST_ID"]
    blacklist = Blacklist.find_by(id: blacklist_id)

    blacklist_user = BlacklistUser.create(user: user, blacklist: blacklist)

    blacklist_user_all = BlacklistUser.where(user: user)
    @updated_blacklists = blacklist_user_all.map do |blacklist_user|
      Blacklist.find(blacklist_user.blacklist_id)
    end
  end
end
