class Api::V1::BlacklistsController < Api::V1::BaseController
  def index
    @blacklists = policy_scope(Blacklist)
    authorize @blacklists
    # @blacklists = current_user.blacklists
  end
end
