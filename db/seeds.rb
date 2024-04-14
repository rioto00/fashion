# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


initial_genres = [
  {name: "カジュアル"},
  {name: "フォーマル"},
  {name: "ストリート"},
  {name: "ヴィンテージ"},
  {name: "テック"},
  {name: "Y2K"},
  {name: "エスニック"},
]
Genre.create(initial_genres)

Admin.create!(
   email: 'admin@admin',
   password: 'admin1',
   password_confirmation: "admin1"
)