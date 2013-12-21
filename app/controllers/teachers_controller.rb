class TeachersController < ApplicationController
  before_filter :authenticate_teacher!
  before_filter :find_teacher_by_id, :only=>[:show, :courses]

  def show
  	if @teacher
  		@company=@teacher.company
  	else
  		redirect_to :back
  	end
  end

  def courses
  	if @teacher
    	@courses=@teacher.courses
    else
    	redirect_to :back
    end
  end

  def edit_info
    @teacher=current_teacher
  end

  def update
  	@teacher=current_teacher
  	@teacher.description=params[:teacher][:description]
  	@teacher[:company]=params[:teacher][:company]
  	@teacher.position=params[:teacher][:position]
  	@teacher.save
  	redirect_to teacher_path('me')
  end

protected

  def find_teacher_by_id
    id=params[:id]

    if id== 'me' && teacher_signed_in?
      @teacher = current_teacher
    elsif admin_signed_in? && id
      @teacher = teacher.find_by_id(id)
    end

  end
end
