require 'spec_helper'

describe HomeController do

  include Devise::TestHelpers

  it 'works' do

    user = User.create :email => "foo@example.com", :password => "password", :password_confirmation => "password"
    #user.confirm!
    sign_in user

    request.env["devise.mapping"] = Devise.mappings[:user]
    get :index
    response.should be_success
    puts response.body

  end

end
