require 'test_helper'

class StudentControllerTest < ActionController::TestCase
  include Devise::TestHelpers	
  setup do
  	init_course
  	sign_in FactoryGirl.create(:student,:id=>100,:email=>"berber@gmail.com", :password=>'a1234567', :username=>"BertHuang")
	  FactoryGirl.create :attend, :course_id=>3, :student_id=>100
	  FactoryGirl.create :attend, :course_id=>5, :student_id=>100
  end

  test "test students routing" do
    assert_routing '/student', {:controller=>'student',:action=>'show'}
    assert_routing({:path=>'/student/1', :method=>'get'}, {:controller=>'student',:action=>'show',:id=>'1'})
    assert_routing({:path=>'/student/5', :method=>'get'}, {:controller=>'student',:action=>'show',:id=>'5'})

    assert_routing({:path=>'/student/course'}, {:controller=>'student',:action=>'course'})
    assert_routing({:path=>'/student/edit'}, {:controller=>'student',:action=>'edit'})

  end

  test "should get show" do
    get :show
    assert_response :success

    assert_equal 'BertHuang', assigns(:student).username

    assert_select '.username', 'BertHuang'
    assert_select '#edit_account[href="/students/edit"]' ,1
    assert_select '#attended_list[href="/student/course"]', 1
    assert_select '#edit_student_info[href="/student/edit"]', 1
  end

  test "should get show without login" do
    sign_out :student
    get :show
    assert_response 302
  end

  test "should get edit" do
  	get :edit
  	assert_response :success
  end

  test "should get course list attend" do
    get :course
    assert_response :success

    assert_select '.course_list>div', 2
    assert_select 'h4>a', 'course name2'
  end
end
