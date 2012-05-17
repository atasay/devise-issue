require "minitest_helper"

class HomeControllerTest < MiniTest::Rails::Controller

  include Devise::TestHelpers

  def test_index
    user = User.create :email => "foo@example.com", :password => "password", :password_confirmation => "password"
    sign_in user

    request.env["devise.mapping"] = Devise.mappings[:user]

    get :index
    assert_response :success
  end
end
