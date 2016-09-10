require 'ffaker'

5.times do
 User.create(
  first_name: FFaker::Name.first_name,
  email: FFaker::Internet.email,
  password: FFaker::Internet.password,
  )
end
