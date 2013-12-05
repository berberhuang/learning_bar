class StudentController < ApplicationController
  before_filter :authenticate_student!
  def show
    @student=current_student
  end

  def course
    @course=current_student.courses
  end

  def edit
	@student=current_student
  end

  def update
	@student=current_student
	@student.update_attributes(params[:student])
	redirect_to '/student'
  end
end
