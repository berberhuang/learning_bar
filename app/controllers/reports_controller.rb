class ReportsController < ApplicationController
	def new
		@report=Report.new
	end
	def create
		@report=Report.new
		@course_id=params[:id]
		cancel_record=Attend
	end
end
