
FactoryGirl.define do
  factory :audition, :class => Refinery::Auditions::Audition do
    sequence(:firstname) { |n| "refinery#{n}" }
  end
end

