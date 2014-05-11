namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 surname: "Example Surname",
                 email: "m@m.m",
                 phone: "123456789",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      surname = Faker::Name.name
      phone = "123456789"
      email = "m#{n+1}@m.m"
      password  = "password"
      User.create!(name: name,
                   surname: surname,
                   email: email,
                   phone: phone,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do |n|
      title = "Domek#{n}"
      typeM = "Kamienica"
      content = Faker::Lorem.sentence(5)
      street = Faker::Address.street_name
      state = Faker::Address.state
      users.each { |user| user.offers.create!(title: title, description: content, typeM: typeM,
        photo: "", street: street, state: state, metrage: 50, roomcount: 4, price: 100000) }
    end
    
     99.times do |n|
      title  = Faker::Name.name
      description  = Faker::Name.name
      photo = "123456789"
    
      street=Faker::Address.street_name
      Offer.create!(title: title, description: description ,photo: photo, street: street )
    end
  end
end