class Api::V1::BlacklistsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, :except => [:signup]
  # acts_as_token_authentication_handler_for User

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

    # Working!!!
    if user
      # blacklist_id = request.env["HTTP_X_BLACKLIST_ID"]
      website_name = request.env["HTTP_X_BLACKLIST_NAME"]
      website_url = request.env["HTTP_X_BLACKLIST_URL"]

      # .where returning an array
      existing_blacklist = Blacklist.where(website_name: website_name)


      unless existing_blacklist[0]

        # If Blacklist doesn't exist yet
        # Create new blacklist
        new_blacklist = Blacklist.create(
            website_name: website_name,
            website_url: website_url
          )
        # Create new BlacklistUser
        BlacklistUser.create(user: User.find(user.id), blacklist: Blacklist.find(new_blacklist.id))

        # Return updated list of blacklists
        blacklist_user_all = BlacklistUser.where(user_id: user.id)
        @updated_blacklists = blacklist_user_all.map do |blacklist_user|
          Blacklist.find(blacklist_user.blacklist_id)
        end

      else

        BlacklistUser.create(user: User.find(user.id), blacklist: Blacklist.find(existing_blacklist[0].id))

        # If Blacklist already exists
        # Check if BlacklistUser already exists
        # existing_blacklist_user = BlacklistUser.where(user: user, blacklist: existing_blacklist)


        # if existing_blacklist_user.length === 0
          # If BlacklistUser doesn't yet exist
          # Create new BlacklistUser
          # new_blacklist_user = BlacklistUser.create(user_id: user.id, blacklist_id: new_blacklist.id)
          # binding.pry

          # new_blacklist_user.save
        # end

        # Return updated list of blacklists
        blacklist_user_all = BlacklistUser.where(user_id: user.id)
        @updated_blacklists = blacklist_user_all.map do |blacklist_user|
          Blacklist.find(blacklist_user.blacklist_id)
        end
      end
    end
  end

  def signup
    user_email = request.env["HTTP_X_USER_EMAIL"]
    signup_user = User.find_by(email: user_email)

    learning_topics_array = JSON::parse(request.env["HTTP_X_USER_LEARNING_TOPICS"])
    blacklist_names_array = JSON::parse(request.env["HTTP_X_USER_BLACKLISTS"])

    # Set user learning topics
    signup_user["interest"] = learning_topics_array[0]
    signup_user.save

    # Set user blacklists
    blacklist_names_array.each do |blacklist_name|
      blacklist_instance = Blacklist.find_by(website_name: blacklist_name)
      # Create new BlacklistUser
      blacklist_user = BlacklistUser.create(user: signup_user, blacklist: blacklist_instance)
      blacklist_user.save
    end
  end
end





















