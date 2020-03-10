class Api::V1::BlacklistsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    # @blacklists = policy_scope(Blacklist)

    user_email = request.env["HTTP_X_USER_EMAIL"]
    user = User.find_by(email: user_email)

    # I want to return all blacklisted websites for this user, using the BlacklistUser table

    @blacklists = user.blacklists
  end
end
