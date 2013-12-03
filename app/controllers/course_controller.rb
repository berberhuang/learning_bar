class CourseController < ApplicationController
  before_filter :authenticate_user!
  def attend
     @attend=Attend.new
     @attend.course_id=params[:course_id]
     @attend.student_id=current_user.id
     
     if @attend.save
	@course=@attend.course
     else
	@course=nil
     end
     
  end

  def attend_confirmation
     @course=Course.find(params[:course_id])
  end


  def cancel_attendence
  end

  def edit
     @course=Course.find(params[:id])
  end

  def new
	@course=Course.new
  end

  def create
	@course=Course.new(params[:course])
	@course.company_id=1	

	@course.save
	redirect_to :controller=>:backbone,:action=>:course_info, :id=>@course.id
  end
 
  def update
        before_filter :authenticate_user!
	@course=Course.find(params[:id])
	params[:course][:company_id]=@course.company_id

	@course.update_attributes(params[:course])
	redirect_to :controller=>:backbone,:action=>:course_info, :id=>@course.id
  end	

end
