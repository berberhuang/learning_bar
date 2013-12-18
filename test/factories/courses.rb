# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 
  factory :course do
    name "First Course"
    company_id 1
    course_date "2013-09-13 19:40:54"
    student_amount 15	
    location "AppWorks"
    agenda "Good Course"
  end

end
