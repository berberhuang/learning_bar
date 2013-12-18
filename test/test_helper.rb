ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

 	def init_course
     	20.times do |t|
	    	FactoryGirl.create(:course,:id=>t+1 ,:name=>'course name'+t.to_s)
     	end
 	end

 	def init_student
     	20.times do |t|
     		FactoryGirl.create(:student,:id=>t+1, :email=>"abc#{t}@gmail.com", :password=>'a1234567', :username=>"abc#{t}", :phone=>'12345678')
      end
  end

  def init_attend
      FactoryGirl.create :attend, :course_id=>3, :student_id=>100
      FactoryGirl.create :attend, :course_id=>3, :student_id=>5
      FactoryGirl.create :attend, :course_id=>5, :student_id=>100
  end

end
