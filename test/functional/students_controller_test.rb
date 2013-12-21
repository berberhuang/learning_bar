require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers	
  setup do
  	init_course
  	sign_in FactoryGirl.create(:student,:id=>100,:email=>"berber@gmail.com", :password=>'a1234567', :username=>"BertHuang")
	  FactoryGirl.create :attend, :course_id=>3, :student_id=>100
	  FactoryGirl.create :attend, :course_id=>5, :student_id=>100
  end

  test "test students routing" do
    assert_routing '/students/1', {:controller=>'students',:action=>'show',:id=>'1'}
    assert_routing({:path=>'/students/1', :method=>'get'}, {:controller=>'students',:action=>'show',:id=>'1'})
    assert_routing({:path=>'/students/5', :method=>'get'}, {:controller=>'students',:action=>'show',:id=>'5'})

    assert_routing({:path=>'/students/1/courses'}, {:controller=>'students',:action=>'courses',:id=>'1'})
    assert_routing({:path=>'/students/1/edit'}, {:controller=>'students',:action=>'edit',:id=>'1'})

  end

  test "should get show" do
    request.env["HTTP_REFERER"]='/'
    get :show,:id=>'me'
    assert_response :success

    assert_equal 'BertHuang', assigns(:student).username

    assert_select '.username', 'BertHuang'
    assert_select '#edit_account[href="/students/edit"]' ,1
    assert_select '#attended_course_list[href="/students/me/courses"]', 1
    assert_select '#edit_student_info[href="/students/edit_info"]', 1
  end

  test "should get show without login" do
    request.env["HTTP_REFERER"]='/'
    sign_out :student
    get :show, :id=>20
    assert_response 302
  end

  test "should get edit_info" do
  	get :edit_info, :id=>20
  	assert_response :success
  end

  test "should get course list attend" do
    request.env["HTTP_REFERER"]='/students/me'
    get :courses,:id=>:me
    assert_response :success

    assert_select '.course_list>div', 2
    assert_select 'h4>a', 'course name2'
  end

  test "should get otherone's course list attend" do
    request.env["HTTP_REFERER"]='/students/me'
    get :courses,:id=>'20'
    assert_response 302
  end

end
