class StudentsController < ApplicationController
  before_filter :authenticate_student!, :except=>[:show]
  before_filter :find_student_by_id, :only=>[:show, :courses]
  def show
    if @student
      @courses=@student.courses
      if student_signed_in?
        @student_editable=true
      end
    else
      redirect_to :back
    end
  end
  def courses
    if @student
      @courses=@student.courses
    else
      redirect_to :back
    end
  end

  def edit_info
    @student=current_student
    if student_signed_in?
      @student_editable=true
    end
  end

  def edit_skill
    @student=current_student
    @skills=@student.skills
  end

  def update
  	@student=current_student
  	@student.update_attributes(params[:student])
  	redirect_to student_path('me')
  end
protected
  def find_student_by_id
    id=params[:id]

    if id== 'me' && student_signed_in?
      @student = current_student
    elsif admin_signed_in? && id
      @student = Student.find_by_id(id)
    end

  end
end
