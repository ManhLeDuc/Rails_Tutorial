# Create a main sample user.
User.create! name: "Adim",
             email: "test@test.com",
             password: "123123",
             password_confirmation: "123123",
             admin: true

99.times do |n|
  name = Faker::Name.name
  email = "test#{n + 1}@test.com"
  password = "123123"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password
end
