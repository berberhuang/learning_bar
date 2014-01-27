class ReportsController < ApplicationController
	def index
		
	end
	def new
		@report=@attend.reports.build
	end
	def create
		@course=Course.find(params[:id])
		@report=@attend.reports.build(params[:id])
		if @report.save
			redirect_to course_path(@course)
		end
	end
	protected
	def find_attend
		@attend=Attend.find(params[:id])
	end
end
