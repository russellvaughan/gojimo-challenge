FactoryGirl.define do
  factory :subject do
    title "Math"
    colour "Red"
    unique_id 1
    association :qualification
  end
end
