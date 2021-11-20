bianca = User.create!(email: "biamatos04s@gmail.com", password: "123456")

pingochi1 = Pingochi.create!(user: bianca, name:"pinguim azul", gender: "male")

categories = Category::TYPES.map do |name|
  Category.create!(name: name)
end

categories.each do |category|
  Item.create!(category: category, description: "Iglu pequeno", name:"Iglu")
end
