# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

titles = ["Consultant", "Business"]

titles.each do |title|
  role = Role.new
  role.title = title
  role.save
end

descriptions = ["1-2 hours / week", "3-5 hours / week", ">5 hours / week"]

descriptions.each do |description|
  time_availability = TimeAvailability.new
  time_availability.description = description
  time_availability.save
end

names = ["Food", "Supply Chain", "Marketing", "Operations", "Healthcare", "Software", "Finance", "Logistics"]

names.each do |name|
  expertise = Expertise.new
  expertise.name = name
  expertise.save
end
