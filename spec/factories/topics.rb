FactoryGirl.define do
  factory :topic do
    name { FFaker::Skill.tech_skills }
  end
end
