class StudentController < ApplicationController
  before_filter :authenticate_student!, :except=>[:show]
  def show
    stu_id=params[:id]
    if admin_signed_in? && stu_id
	@student=Student.find(stu_id)
    elsif student_signed_in?
	@student=current_student
    else
	redirect_to :back
    end
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
