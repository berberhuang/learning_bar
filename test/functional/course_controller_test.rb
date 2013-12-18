#encoding: utf-8
require 'test_helper'

class CourseControllerTest < ActionController::TestCase
	include Devise::TestHelpers
	setup do
      init_student
  		init_course
  		init_attend

  		sign_in FactoryGirl.create(:student,:id=>100,:email=>"berber@gmail.com", :password=>'a1234567', :username=>"BertHuang")
  end

  test "test course's routing" do
    assert_routing({:path=>'/course/20'}, {:controller=>'course',:action=>'show',:id=>'20'})
    assert_routing({:path=>'/course/5'}, {:controller=>'course',:action=>'show',:id=>'5'})
    assert_routing({:path=>'/course/index'}, {:controller=>'course',:action=>'index'})
    assert_routing({:path=>'/course/attend'}, {:controller=>'course',:action=>'attend'})
    assert_routing({:path=>'/course/attend_confirmation'}, {:controller=>'course',:action=>'attend_confirmation'})
    assert_routing({:path=>'/course/cancel_attendence/20'}, {:controller=>'course',:action=>'cancel_attendence',:id=>'20'})
  end

  test "should get course list" do
  	get :index
  	assert_response :success
  end

  test "should get show" do
    get :show, :id=>2
    assert_response :success
    assert_select '.attend', 1
    assert_select '.attended', 0
    assert_select '.course_name', 'course name1'
  end

  test "should get show in admin's view" do
    sign_out :student
    sign_in FactoryGirl.create(:admin,:email=>"berber@gmail.com", :password=>'a1234567', :username=>"BertHuang")
    get :show, :id=>3

    assert_response :success

    assert_nil assigns(:attend)

    assert_equal 'course name2', assigns(:course).name

    assert_select '#attended_list' do
      assert_select 'li', 2
    end
  end

  test "should get attend_confirmation page" do
    get :attend_confirmation, :course_id=>2
    assert_response :success
    assert_select 'h1','確認報名:course name1'
    assert_equal Attend.select('id').where(:course_id=>2, :student_id=>100).size , 0
  end

  test "should get attend" do
    get :attend, :course_id=>2
    assert_response :success

    assert_select 'h1','成功報名課程:course name1'
    assert_equal Attend.select('id').where(:course_id=>2, :student_id=>100).size , 1
    
  end

  test "should get show after attended" do
    get :show, :id=>3
    assert_response :success
    
    assert_select '.course_name', 'course name2'
    assert_select '.attend', 0
    assert_select '.attended', 1
  end

  test "should get attend_confirmation page after attended" do
    get :attend_confirmation, :course_id=>3
    assert_response 302

    assert_redirected_to :controller=>'course',:action=>'show', :id=>'3'
    assert_equal 1, Attend.select('id').where(:course_id=>3, :student_id=>100).size
  end

  test "should get attend after attended" do
    get :attend, :course_id=>3
    assert_response 302
    
    assert_redirected_to :controller=>'course',:action=>'show', :id=>'3'
    assert_equal 1, Attend.select('id').where(:course_id=>3, :student_id=>100).size 
    
  end

  test "should get cancel attendence" do
    get :cancel_attendence, :id=>3

    assert_response 302
    assert_equal 0, Attend.select('id').where(:course_id=>3, :student_id=>100).size
    assert_redirected_to :controller=>:student, :action=>:course
  end
end