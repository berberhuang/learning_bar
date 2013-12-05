class Student < ActiveRecord::Base
	belongs_to :user
	has_many :attends
	has_many :courses,:through=>:attends
end
