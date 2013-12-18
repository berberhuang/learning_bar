class CoursesController < ApplicationController
  before_filter :authenticate_student!,:only=>[:attend,:attend_confirmation,:cancel_attendence]
  before_filter :authenticate_admin!,:only=>[:new,:create,:edit,:update]
  def index
    @courses=Course.all
  end

  def show
     course_id=params[:id].to_i
     @course=Course.find(course_id)
     
     if student_signed_in?
      @attend = current_student.attends.select{|i| i.course_id==course_id}.size > 0
     elsif admin_signed_in?
      @students=@course.students
     end
  end

  def attend
     student=current_student
     course_id=params[:course_id]
     student_id=student.id

     if student.attends.select{|i| i.course_id==course_id.to_i}.size > 0
      redirect_to '/courses/'+course_id
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
     if current_student.attends.select{|i| i.course_id==course_id.to_i}.size > 0
      redirect_to '/course/'+course_id
     end    

     @course=Course.find(course_id)
     
  end


  def cancel_attendence
	@course_id=params[:id]
	@student_id=current_student.id
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
