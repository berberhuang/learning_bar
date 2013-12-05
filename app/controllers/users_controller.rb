class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user=current_user
    @student=Student.find(session[:student_id])
  end

  def course
    @course=Student.find(session[:student_id]).courses
  end
end
