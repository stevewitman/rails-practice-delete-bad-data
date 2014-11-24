User.destroy_all
Person.destroy_all
Location.destroy_all

User.create!(
  name: "Some User",
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Person.create!(
  title: "Mr",
  first_name: "Joe",
  last_name: "Example"
)

10.times do
  title = Faker::Name.prefix
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Person.create!(
  {first_name: first_name,
  last_name: last_name,
  title: title}
  )
end

10.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create!({
    name: name,
    email: email,
    password: 'password',
    password_confirmation: 'password'
    })
end

10.times do
  name = Faker::Address.state
  Location.create!({
    name: name
    })
end


["Northeast", "Midwest", "Mountain West", "Northwest", "Southwest", "Deep south", "Texas"].each do |name|
  Location.create!(name: name)
end
