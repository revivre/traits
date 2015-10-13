FactoryGirl.define do
  factory :user do
    name     "Test User"
    password "password"
    password_confirmation "password"
    password_digest User.digest('password')
  end
end
