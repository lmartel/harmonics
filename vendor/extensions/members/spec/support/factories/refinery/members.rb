
FactoryGirl.define do
  factory :member, :class => Refinery::People::Member do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

