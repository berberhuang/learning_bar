class SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
     super
     if user_signed_in?
	session[:user_identity]=Student.find_by_user_id(current_user.id)
     end
  end

  # DELETE /resource/sign_out
  def destroy
	super
	session[:user_identity]=nil
  end
end
