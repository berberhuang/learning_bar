# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email "abc1@gmail.com"
    password "a1234567"
    username "abc1"
    phone "123456"
  end
end
