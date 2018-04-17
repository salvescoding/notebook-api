namespace :dev do
  desc "Setup the development environment"
  task setup: :environment do
    puts "Registering contacts"
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago)
        )
    end
    puts "Contacts registered successfullyq"
  end

end
