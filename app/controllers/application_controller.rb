class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(courses)
  	if !session[:course_id].nil?
  		course_path(session[:course_id])
    end
  end
end
