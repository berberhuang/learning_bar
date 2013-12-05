class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.id
	s=Student.new
	s.user_id=resource.id
	s.description=''
	s.save
    end
    
  end

  def update
    super
    @student=Student.find(session[:student_id])
    @student.description=params[:student][:description]
    @student.save
  end

  def after_update_path_for(resource)
      '/users'
  end
end 
