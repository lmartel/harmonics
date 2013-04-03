
FactoryGirl.define do
  factory :album, :class => Refinery::Albums::Album do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

