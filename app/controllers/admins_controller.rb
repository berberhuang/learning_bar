class AdminsController < ApplicationController
  def show
	@courses=Course.all()
  end
end
