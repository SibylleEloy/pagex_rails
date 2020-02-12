# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

9.times do |i|
  User.create(
    first_name: "User_first_name #{i + 1}",
    last_name: "User_last_name #{i + 1}",
    email: "User_email #{i + 1}",
    password: "Usser_password #{i + 1}",
    image: "https://raw.githubusercontent.com/do-community/react_rails_recipe/master/app/assets/images/Sammy_Meal.jpg"
  )
  puts "Completed!"
end
