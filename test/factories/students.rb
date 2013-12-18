# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
  	email "abc@gmail.com"
    password "a1234567"
    username "abc"
    phone "123456"
  end
end
