#encoding: utf-8
class CoursesController < ApplicationController
  before_filter :authenticate_student!,:only=>[:attend,:attend_confirmation,:cancel_attendence]
  before_filter :authenticate_admin!,:only=>[:new,:create,:update]
  before_filter :find_course, :except=>[:index, :show, :new, :create, :attendee_info ]
  before_filter :find_student, :except=>[:index, :new, :create,:edit,:update, :attendee_info ]
  def index
    @courses=Course.all
  end

  def show
   course_id=params[:id].to_i
   status=params[:status].to_i
   @course=Course.find(course_id)
   @companies=@course.companies
   @teachers=@course.teachers
   session[:course_id]=course_id
   if student_signed_in?
      @attended = @student.attends.select{|i| i.course_id==course_id && i.status<2}.size>0
      @attending_firstime = @student.attends.select{|i| i.course_id==course_id }.size<1
      @re_attended=@student.attends.select{|i| i.course_id==course_id && i.status>1}.size>0
   elsif admin_signed_in?
      @students=@course.students
   elsif teacher_signed_in?
      teacher=current_teacher
      if(TeachingCourseShip.exists?(:teacher_id=>teacher.id, :course_id=>course_id.to_s ))
        @students=@course.students
      end
   end
  end

  def edit
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
   params[:course][:company_id]=@course.company_id

   @course.update_attributes(params[:course])
   redirect_to :action=>:show, :id=>@course.id
  end 

  def attend_confirmation
    course_id=@course.id
    student_id=@student.id
    @attendance=Attend.select(:id).where('course_id=? AND student_id=?', course_id, student_id)
   # course_id=params[:id]
    if @attendance.where("status<?", 2).exists?
     redirect_to '/courses/'+course_id
    elsif @attendance.where("status>?", 1).exists?
    @attend=@attendance
    else
    @attend=Attend.new
   end
 end

  #  if Attend.select(:id).where()
  #  @attend=Attend.new
  #  @course=Course.find(course_id)
  # end

  def attend
   course_id=@course.id
   student_id=@student.id
   @attendance=Attend.select(:id).where('course_id=? AND student_id=?', course_id,student_id)
   Rails.logger.info @course.inspect
   if @attendance.where("status<?",2 ).exists?
     redirect_to '/courses/'+course_id
     return 
   end
   Rails.logger.info @attendance.inspect
   if @attendance.where("status>?", 1).blank?
    
    @attend=Attend.new(params[:attend])
    @attend.course_id=course_id
    @attend.student_id=student_id
    @attend.status=0
   else
    @attend=@attendance.first.update_attributes!(:status=>0)
   end
    @attend.save
 end
 def re_attend_confirmation
  course_id=@course.id
  student_id=@student.id
  @attend=@course.attends.where('course_id=? AND student_id=?', course_id, student_id).where('status>?',1).first
  Rails.logger.info @attend.inspect

 end
 def re_attend
  @attendance=Attend.where('course_id=? AND student_id=?', @course.id,@student.id)
  @attend=@attendance.where('status>?',1).first
  @attend.update_column(:status,0)
  redirect_to course_path(@course)
 end

   # if Attend.select(:id).where('course_id=? AND student_id=?',course_id)

   # @attend=Attend.new(params[:attend])
   # @attend.course_id=course_id
   # @attend.student_id=student_id
   # @attend.status=0

   # if @attend.save
   #  @course=@attend.course
   # else
   #  @course=nil
   # end

  def cancel_attendance
    student_id=@student.id
    course_id=@course.id
    @attend=@course.attends.where("course_id=? AND student_id=?",course_id, student_id).where("status <?",2)
    Rails.logger.info @attend.inspect
    if @attend
      @report=Report.new
    end

  end
  def cancel_attendance_report
    course_id=@course.id
    student_id=@student.id
    a=Attend.where('course_id=? AND student_id=?', course_id, student_id)
    @report=Report.new(params[:report])
    a[0].update_attributes(:status=>2)
    if @report.save
      redirect_to course_path(@course_id)
      flash[:alert]="取消成功"
    end
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

 

protected 

  def auauthenticate_admin_or_company_or_teacher
  end
  def find_course
    @course=Course.find(params[:id])
  end
  def find_student 
    @student=current_student
  end

end
