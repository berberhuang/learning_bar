require 'test_helper'

class CourseControllerTest < ActionController::TestCase
  test "should get attend" do
    get :attend
    assert_response :success
  end

  test "should get attend_confirmation" do
    get :attend_confirmation
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

  test "should get cancel_attendence" do
    get :cancel_attendence
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

end
