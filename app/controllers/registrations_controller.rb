class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

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
  end
end 
