namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 surname: "Example Surname",
                 email: "example@railstutorial.org",
                 phone: "123456789",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      surname = Faker::Name.name
      phone = "123456789"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   surname: surname,
                   email: email,
                   phone: phone,
                   password: password,
                   password_confirmation: password)
    end
  end
end