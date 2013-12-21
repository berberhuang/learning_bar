# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    username "MyString"
    phone "MyString"
    company "MyString"
    description "MyText"
    position "MyString"
  end
end
