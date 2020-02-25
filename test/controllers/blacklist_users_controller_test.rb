require 'test_helper'

class BlacklistUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get blacklist_users_create_url
    assert_response :success
  end

end
