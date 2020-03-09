class Api::V1::BlacklistsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    # @blacklists = policy_scope(Blacklist)

    # add blacklists by user

    @blacklists = current_user.blacklists
    # authorize @blacklists
  end
end
