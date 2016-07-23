User.create!(name: "Getty",
            email: "you-Getty@seeds.org",
            password: "andrew",
            password_confirmation: "andrew",
            admin: true)
            # activated: true,
            # activated_at: Time.zone.now)

14.times do |n|
name = Faker::Name.name
email = "you-#{n+1}@seeds.org"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password)
end
