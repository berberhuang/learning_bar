class CourseCatagoriesController < ApplicationController
	before_filter :find_catagory
	def show
		@catagory=CourseCatagory.find(params[:id])
		course_catagory_id=@catagory.id
		@courses=Course.where('course_catagory_id=?', course_catagory_id)
		
	end
	private
	def find_catagory
		@catagory=CourseCatagory.find(params[:id])
	end
end
