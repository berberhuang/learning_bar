class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.id
	s=Student.new
	s.user_id=resource.id
	s.description=''
	s.save
	session[:student_id]=s.id
    end
    
  end

  def after_update_path_for(resource)
      '/users'
  end
end 
