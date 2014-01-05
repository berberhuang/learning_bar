class TeacherRegistrationsController < Devise::RegistrationsController
  	def new
  		super
      # if admin_signed_in?	
  		# 	super
  		# else
  		# 	redirect_to '/'
  		# end
  	end

  	def create
      super
  		# if admin_signed_in?
  		# 	super
  		# else
  		# 	redirect_to '/'
  		# end
  	end

      def update
      @student = Teacher.find(current_student.id)

      successfully_updated = if needs_password?(@teacher, params)
        @teacher.update_with_password(params[:teacher])
      else
        # remove the virtual current_password attribute update_without_password
        # doesn't know how to ignore it
        params[:teacher].delete(:current_password)
        @teacher.update_without_password(params[:teacher])
      end

      if successfully_updated
        set_flash_message :notice, :updated
        # Sign in the teacher bypassing validation in case his password changed
        sign_in @teacher, :bypass => true
        redirect_to after_update_path_for(@teacher)
      else
        render "edit"
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

    private

    # check if we need password to update teacher data
    # ie if password or email was changed
    # extend this as needed
    def needs_password?(teacher, params)
      teacher.email != params[:teacher][:email] ||
        params[:teacher][:password].present?
    end
end 
