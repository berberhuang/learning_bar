#encoding: utf-8
class StudentsSkillShipsController < ApplicationController
	before_filter :authenticate_student!,:except=>:index
	def index
		skills=Skill.find(:all,:conditions=>['skill_name LIKE ?','%'+params[:term]+'%'],:limit=>'5')
		render :json=>skills.map{|s| s.skill_name}.to_json
	end

	def create
		s=StudentSkillShip.new(params[:student_skill_ship])
		if params[:student_id].to_i!=current_student.id
			redirect_to :back
			return
		end

	    if s.skill_id.to_i==-1
	    	skill=Skill.find_by_skill_name(params[:other_skill])
	    	skill=Skill.new(:skill_name=>params[:other_skill]) if !skill
	    	skill.save
	    	s.skill_id=skill.id
	    end
	    s.student_id=current_student.id
	    s.save

	    redirect_to edit_skills_student_path('me')
	end

	def update
		s=StudentSkillShip.find(params[:id])
		if s.student_id!=current_student.id
			redirect_to :back
			return
		end
		s.skill_description=params[:description]
		s.save

		render :json =>{status:true}
	end
	def destroy
		s=StudentSkillShip.find(params[:id])
		if s.student_id!=current_student.id
			redirect_to :back
			return
		end
		s.destroy
		render :json =>{status:true}
	end
end
