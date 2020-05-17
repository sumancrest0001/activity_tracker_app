FactoryBot.define do
  factory :user do
    name { 'suman shrestha' }
    email { 'suman123@gmail.com' }
    password { 'suman12345' }
  end

  factory :invalid_user do
    name { 'suman shrestha12' }
    email { 'suman' }
    password { 'suman12345' }
  end
end
