#encoding: utf-8
class SkillsController < ApplicationController
	def index
		@skills=Skill.all
	end
	def show
		skill_id=params[:id].to_s
		@skill=Skill.find(skill_id)
	end
	def new
		@skill=Skill.new
	end
	def create
		@skill=Skill.new(params[:skill])
		@skill.save
		redirect_to :action=>:index
	end
	def edit

	end
	def update
		
	end
	def destroy
		
	end
end
