FactoryGirl.define do
  factory :user_role do
    sequence(:name) { |n| "UserRole %04d" % n }
  end
end
