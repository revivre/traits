FactoryGirl.define do
  factory :user do
    name     "Test User"
    password "foobar"
    password_confirmation "foobar"
  end
end
