namespace :dev do
  desc "Setup the development environment"
  task setup: :environment do


    kinds = %w(Friend Business Comercial)

    kinds.each do |kind|
      Kind.create(
        description: kind
        )
    end


    puts "Registering contacts"
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
        )
    end
    puts "Contacts registered successfully"


  end
end
