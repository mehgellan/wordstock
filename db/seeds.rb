require 'ffaker'

5.times do
 User.create(
  first_name: FFaker::Name.first_name,
  email: FFaker::Internet.email,
  password: FFaker::Internet.password,
  )
end

User.all.each do |user|
  3.times do
    Topic.create(
      name: [ FFaker::Education.major, FFaker::Music.genre, FFaker::Skill.tech_skill, FFaker::Sport.name].sample,
      user_id: user.id
    )
  end
end
