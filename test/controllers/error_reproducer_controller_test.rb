require "minitest_helper"

class ErrorReproducerControllerTest < MiniTest::Rails::Controller

  include Devise::TestHelpers

  def test_index
    user = User.create :email => "foo@example.com", :password => "password", :password_confirmation => "password"
    sign_in user

    request.env["devise.mapping"] = Devise.mappings[:user]

    post :create  # <------------   This is where the error occurs
    assert_response :success
  end
end
