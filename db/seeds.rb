bianca = User.create!(email: "biamatos04s@gmail.com", password: "123456")

pingochi1 = Pingochi.create!(user: bianca, name:"pinguim azul", gender: "male")

categories = Category::TYPES.map do |name|
  Category.create!(name: name)
end

categories.each do |category|
  Item.create!(category: category, description: "Little Igloo", name:"Igloo")
end

categories.each do |category|
  Item.create!(category: category, description: "Scarf blue", name:"Scarf")
end

categories.each do |category|
  Item.create!(category: category, description: "Fishing rod black", name:"Fishing rod")
end

categories.each do |category|
  Item.create!(category: category, description: "Shirt", name:"Clothes")
end

categories.each do |category|
  Item.create!(category: category, description: "Blue Sneakers", name:"Shoes")
end

categories.each do |category|
  Item.create!(category: category, description: "Red hat", name:"Hat")
end

categories.each do |category|
  Item.create!(category: category, description: "Fish", name:"Food")
end
