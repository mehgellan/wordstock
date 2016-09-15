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

Topic.all.each do |topic|
  3.times do
    Word.create(
      term: FFaker::HealthcareIpsum.word,
      pos: [ 'noun', 'adjective', 'verb'].sample,
      definition: [FFaker::DizzleIpsum.sentence, FFaker::HealthcareIpsum.sentence, FFaker::HipsterIpsum.sentence].sample,
      topic_id: topic.id
    )
  end
end
