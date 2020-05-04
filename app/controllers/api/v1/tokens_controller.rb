class Api::V1::TokensController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:login_return_token]

  def login_return_token
    user_email = request.env["HTTP_X_USER_EMAIL"]
    user_password = request.env["HTTP_X_USER_PASSWORD"]

    # user = User.find_by(email: user_email)
    user = User.find_by(email: user_email)

    if user.valid_password?(user_password)
      message = {
        status: 'SUCCESS',
        authentication_token: user.authentication_token
      }
    else
      message = {
        status: 'User not found with this email and password',
      }
    end

    render json: message
  end
end
