
categories = Category::TYPES.map do |name|
  Category.create!(name: name)
end

categories.each do |category|
  Item.create!(category: category, description: "Iglu pequeno", name:"Iglu")
end
