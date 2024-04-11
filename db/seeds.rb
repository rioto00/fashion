# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


initial_genres = [
  {name: "tops"},
  {name: "outer"},
  {name: "bottom"},
  {name: "Skirts"},
  {name: "Sweaters"},
  {name: "Jackets"},
  {name: "item"},
]
Genre.create(initial_genres)

Admin.create!(
   email: 'admin@admin',
   password: 'admin1',
   password_confirmation: "admin1"
)