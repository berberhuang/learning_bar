class AdminsController < ApplicationController
  def show
	 @admin=current_admin
	 @courses=Course.all
  end
end
