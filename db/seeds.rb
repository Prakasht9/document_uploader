require 'faker'

# clean tables
User.destroy_all

users_data = []
10.times do
  users_data.push({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'admin007',
    password_confirmation: 'admin007'
  })
end
User.create(users_data)

Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used values for all generators
