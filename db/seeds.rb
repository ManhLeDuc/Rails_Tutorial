# Create a main sample user.
User.create!  name: "Admin",
              email: "test@test.com",
              password: "123123",
              password_confirmation: "123123",
              admin: true,
              activated: true,
              activated_at: Time.zone.now

49.times do |n|
  name = Faker::Name.name
  email = "test#{n + 1}@test.com"
  password = "123123"
  User.create!  name: name,
                email: email,
                password: password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now
end
