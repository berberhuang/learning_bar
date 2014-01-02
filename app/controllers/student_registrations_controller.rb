class StudentRegistrationsController < Devise::RegistrationsController
	def update
	    @student = Student.find(current_student.id)

	    successfully_updated = if needs_password?(@student, params)
	      @student.update_with_password(params[:student])
	    else
	      # remove the virtual current_password attribute update_without_password
	      # doesn't know how to ignore it
	      params[:student].delete(:current_password)
	      @student.update_without_password(params[:student])
	    end

	    if successfully_updated
	      set_flash_message :notice, :updated
	      # Sign in the student bypassing validation in case his password changed
	      sign_in @student, :bypass => true
	      redirect_to after_update_path_for(@student)
	    else
	      render "edit"
	    end
	  end

	  private

	  # check if we need password to update student data
	  # ie if password or email was changed
	  # extend this as needed
	  def needs_password?(student, params)
	    student.email != params[:student][:email] ||
	      params[:student][:password].present?
	  end

	  def find_student_by_id
	    id=params[:id]

	    if id== 'me' && student_signed_in?
	      @student = current_student
	    elsif admin_signed_in? && id
	      @student = Student.find_by_id(id)
	    end

	  end
end
