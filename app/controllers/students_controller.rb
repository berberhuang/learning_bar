class StudentsController < ApplicationController
  before_filter :authenticate_student!, :except=>[:show]
  before_filter :find_student_by_id
  def show
    if @student
      @courses=@student.courses.includes(:teachers)
      @skills= @student.student_skill_ships.includes(:skill)
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
    if @student
      @student_editable=true
    else
      redirect_to :back
    end
  end

  def edit_skills
    if @student
      @student_editable=true
      @skills= @student.student_skill_ships.includes(:skill)
      @skill_options= Skill.all

      @new_skill=StudentSkillShip.new()
    else
      redirect_to :back
    end

  end

  def update
    if @student
      logger.info "work"
      @student.update_attributes(params[:student])
      
      redirect_to student_path('me')
    else
      redirect_to :back
    end
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
