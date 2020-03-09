class Api::V1::BlacklistsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    # @blacklists = policy_scope(Blacklist)
    # authorize @blacklists

    # Set user
    # @user = User.where(authentication_token: params[:authentication_token])

    @blacklists = Blacklist.all

  end

  def show
    @blacklist = Blacklist.find(params[:id])
    authorize @blacklist
  end

end
