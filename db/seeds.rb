User.destroy_all
Person.destroy_all
Location.destroy_all
Assignment.destroy_all

User.create!(
  name: "Some User",
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

people = 30.times.map do
  title = Faker::Name.prefix
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Person.create!(
    first_name: first_name,
    last_name: last_name,
    title: title,
  )
end

locations = 15.times.map do
  name = Faker::Address.state
  Location.create!(name: name)
end

max_person_id = Person.maximum(:id)
person_ids = people.map(&:id) + ((max_person_id + 1)..(max_person_id + 20)).to_a

max_location_id = Location.maximum(:id)
location_ids = locations.map(&:id) + ((max_location_id + 1)..(max_location_id + 10)).to_a

100.times do
  role = Faker::Name.title
  Assignment.create!(
    role: role,
    location_id: location_ids.sample,
    person_id: person_ids.sample
  )
end
