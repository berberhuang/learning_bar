class StudentController < ApplicationController
  before_filter :authenticate_user!
  def edit
	@student=Student.find(session[:student_id])
  end

  def update
	@student=Student.find(session[:student_id])
	@student.update_attributes(params[:student])
	redirect_to '/users'
  end
end
