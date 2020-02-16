# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "starting seed"
Content.destroy_all
User.destroy_all

charles = User.create(email: "charles@gmail.com", password: "123456", first_name: "charles", last_name: "stas", image: "https://raw.githubusercontent.com/do-community/react_rails_recipe/master/app/assets/images/Sammy_Meal.jpg")
sibylle = User.create(email: "sibylle@gmail.com", password: "123456", first_name: "sibylle", last_name: "eloy", image: "https://raw.githubusercontent.com/do-community/react_rails_recipe/master/app/assets/images/Sammy_Meal.jpg")
martin = User.create(email: "martin@gmail.com", password: "123456", first_name: "martin", last_name: "navarete", image: "https://raw.githubusercontent.com/do-community/react_rails_recipe/master/app/assets/images/Sammy_Meal.jpg")
priscille = User.create(email: "priscille@gmail.com", password: "123456", first_name: "priscille", last_name: "toulemonde", image: "https://raw.githubusercontent.com/do-community/react_rails_recipe/master/app/assets/images/Sammy_Meal.jpg")



9.times do |i|
  Content.create(
    user: sibylle,
    title: "Lorem #{i + 1}",
    text: "Quis enim aut eum diligat quem metuat, aut eum a quo se metui putet? Coluntur tamen simulatione dumtaxat ad tempus. Quod si forte, ut fit plerumque, ceciderunt, tum intellegitur quam fuerint inopes amicorum. Quod Tarquinium dixisse ferunt, tum exsulantem se intellexisse quos fidos amicos habuisset, quos infidos, cum iam neutris gratiam referre posset.",
    image: "https://www.oberlo.fr/wp-content/uploads/sites/4/2018/05/heroimage-1-880x470.jpg"
  )
  puts "Completed!"
end
