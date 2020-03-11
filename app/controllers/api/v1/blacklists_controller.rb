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
    user_token = request.env["HTTP_X_USER_TOKEN"]

    user = User.find_by(email: user_email, authentication_token: user_token)

    if user

      # Check within extension background.js whether website_name already exists

      # 1. Create Blacklist
      # If extension doesn't provide ID => blacklist doesn't yest exist and needs to be created new
      # blacklist_id should be nill
      blacklist_id = request.env["HTTP_X_BLACKLIST_ID"]
      if !blacklist_id
        new_blacklist = Blacklist.create(
            website_name: request.env["HTTP_X_BLACKLIST_NAME"],
            website_url: request.env["HTTP_X_BLACKLIST_URL"]
          )
        # 2. Create BlacklistUser
        BlacklistUser.create(user: User.find(user.id), blacklist: Blacklist.find(new_blacklist.id))

        # Return updated list of blacklists
        blacklist_user_all = BlacklistUser.where(user: User.find(user.id))
        @updated_blacklists = blacklist_user_all.map do |blacklist_user|
          Blacklist.find(blacklist_user.blacklist_id)
        end
      end
    end
  end
end
