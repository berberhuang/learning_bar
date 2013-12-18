require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
   include Devise::TestHelpers

   setup do
      sign_in FactoryGirl.create(:admin,:email=>'hello1@gmail.com', :username=>'abc1')
      init_course
   end

  test "should get show" do
    get :show
    assert_response :success
  
    assert_equal 'abc1', assigns(:admin).username

    assert_select '.username', 'Admin abc1'
    
    assert_select '.course_name' do |elements|
      elements.each_with_index do |element,i|
        assert_select element, 'a', 'course name'+(i).to_s
      end
    end

  end

end