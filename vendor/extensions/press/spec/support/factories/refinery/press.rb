
FactoryGirl.define do
  factory :endorsement, :class => Refinery::Press::Endorsement do
    sequence(:quote) { |n| "refinery#{n}" }
  end
end

