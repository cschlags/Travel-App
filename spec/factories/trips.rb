# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    trip_name "MyString"
    location "MyString"
    user_id 1
    to_pack "MyText"
    to_do "MyText"
    budget 1
  end
end
