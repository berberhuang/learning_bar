class SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
     super
     if user_signed_in?
	     session[:student_id]=Student.find_by_user_id(current_user.id).id
     end
  end

  # DELETE /resource/sign_out
  def destroy
	super
	session[:student_id]=nil
  end
end
