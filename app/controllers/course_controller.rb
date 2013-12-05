class CourseController < ApplicationController
  before_filter :authenticate_user!,:except=>[:show]

  def show
     course_id=params[:id].to_i
     @course=Course.find(course_id)
     @attend=false
     
     s=Student.find(session[:student_id])
     if s
	@attend = s.attends.select{|i| i.course_id==course_id}.size > 0
     end
  end

  def attend
     course_id=params[:course_id]
     student_id=session[:student_id]

     if Student.find(session[:student_id]).attends.select{|i| i.course_id==course_id.to_i}.size > 0
	redirect_to '/course/'+course_id
     end  
  
     @attend=Attend.new
     @attend.course_id=course_id
     @attend.student_id=student_id
          

     if @attend.save
	@course=@attend.course
     else
	@course=nil
     end
     
  end

  def attend_confirmation
     course_id=params[:course_id]
     if Student.find(session[:student_id]).attends.select{|i| i.course_id==course_id.to_i}.size > 0
	redirect_to '/course/'+course_id
     end    

     @course=Course.find(course_id)
     
  end


  def cancel_attendence
	@course_id=params[:id]
	@student_id=session[:student_id]
	a=Attend.where(:course_id=>@course_id, :student_id=>@student_id)
	a[0].destroy
	redirect_to :back
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
	redirect_to :action=>:show, :id=>@course.id
  end
 
  def update
	@course=Course.find(params[:id])
	params[:course][:company_id]=@course.company_id

	@course.update_attributes(params[:course])
	redirect_to :action=>:show, :id=>@course.id
  end	

end
