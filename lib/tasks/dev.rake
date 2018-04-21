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


    puts "Adding phone number to contacts"
    Contact.all.each do |contact|
      Random.rand(5).times do
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Adding phone number completed"

  end
end
