class Students::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
     
    @student = Student.find_for_google_oauth2(request.env["omniauth.auth"], current_student)

    if !@student
      @new_student=Student.create_for_google_oauth2(request.env["omniauth.auth"], current_student)
      puts 'create a new record'
      sign_in @new_student, :event => :authentication
      redirect_to edit_student_registration_path
    elsif @student.persisted?
      puts "already exists"
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @student, :event => :authentication
    end
  end
end