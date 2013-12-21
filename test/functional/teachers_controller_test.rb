require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
  	sign_in FactoryGirl.create :teacher ,:id=>'20', :email=>'ber@gmail.com', :password=>'a1234567'
  end

  #test "should get show" do
  #  get :show, :id=>'20'
  #  assert_response :success  
  #end

end
