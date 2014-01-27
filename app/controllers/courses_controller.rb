#encoding: utf-8
class CoursesController < ApplicationController
  before_filter :authenticate_student!,:only=>[:attend,:attend_confirmation,:cancel_attendence]
  before_filter :authenticate_admin!,:only=>[:new,:create,:update]
  def index
    @courses=Course.all
  end

  def show
   course_id=params[:id].to_i
   status=params[:status].to_i
   @course=Course.find(course_id)
   @course.logger
   @companies=@course.companies
   @teachers=@course.teachers

   if student_signed_in?
      @attend = current_student.attends.select{|i| i.course_id==course_id && i.status<2}.size>0
   elsif admin_signed_in?
      @students=@course.students
   elsif teacher_signed_in?
      teacher=current_teacher
      if(TeachingCourseShip.exists?(:teacher_id=>teacher.id, :course_id=>course_id.to_s ))
        @students=@course.students
      end     
   end
  end

  def attend_confirmation
   course_id=params[:id]
   if Attend.select(:id).where(:course_id=>course_id, :student_id=>current_student.id).where("status<?", 2).size > 0
     redirect_to '/courses/'+course_id
     return 
   end    
   @attend=Attend.new
   @course=Course.find(course_id)
  end

  def attend
   @student=current_student
   course_id=params[:id]
   student_id=@student.id
   status=params[:id]

   if Attend.select(:id).where(:course_id=>course_id, :student_id=>student_id).where("status<?",2 ).size > 0
     redirect_to '/courses/'+course_id
     return 
   end  

   @attend=Attend.new(params[:attend])
   @attend.course_id=course_id
   @attend.student_id=student_id
   @attend.status=0


   if @attend.save
    @course=@attend.course
   else
    @course=nil
   end

  end

  def cancel_attendance
    redirect_to new_report_path
  end
  def cancel_attendance_report
    @course_id=params[:id]
    @student_id=current_student.id
    a=Attend.where(:course_id=>@course_id, :student_id=>@student_id)
    a[0].update_attributes(:status=>2)
    #redirect_to course_path(@course_id)
    #flash[:alert]="取消成功"
  end

  def attendee_info
    course_id=params[:id]
    if( admin_signed_in? or (teacher_signed_in? and TeachingCourseShip.exists?(:course_id=>course_id, :teacher_id=>current_teacher.id)))
      @course=Course.find(course_id)
      @students=Student.select('students.id,username,course_expect').joins(:attends).where('attends.course_id='+course_id)
    else
      redirect_to :back
    end
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

protected 

  def auauthenticate_admin_or_company_or_teacher
  end

end
