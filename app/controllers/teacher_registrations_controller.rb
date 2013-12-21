class TeacherRegistrationsController < Devise::RegistrationsController
  	def new
  		if admin_signed_in?	
  			super
  		else
  			redirect_to '/'
  		end
  	end

  	def create
  		if admin_signed_in?
  			super
  		else
  			redirect_to '/'
  		end
  	end

  	def destroy
  		if admin_signed_in?
  			super
  		else
  			redirect_to '/'
  		end
  	end

  	def cancel
  		if admin_signed_in?
  			super
  		else
  			redirect_to '/'
  		end
  	end
end 
