require 'faker'

puts "Destroying old seed"
Item.destroy_all
Category.destroy_all

puts 'Creating Item Categories...'
category_types = ["Igloo", "Scarf", "Fishing Rods", "Clothes", "Shoe", "Hat", "Food"]
category_types.each do |category|
  Category.create!(name: category)
end

puts 'Creating 50 igloos...'
50.times do
  igloo = Item.new(
    category: Category.find_by(name: "Igloo"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Igloo #{Faker::Code.ean}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500)
  )
  igloo.save!
end

puts 'Creating 50 scarfs...'
50.times do
  scarf = Item.new(
    category: Category.find_by(name: "Scarf"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Scarf #{Faker::Code.ean}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500)
  )
  scarf.save!
end

puts 'Creating 50 Fishing Rods...'
50.times do
  fishing_rods = Item.new(
    category: Category.find_by(name: "Fishing Rods"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Fishing Rod #{Faker::Code.ean}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500)
  )
  fishing_rods.save!
end

puts 'Creating 50 Clothes...'
50.times do
  clothes = Item.new(
    category: Category.find_by(name: "Clothes"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Clothes #{Faker::Code.ean}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500)
  )
  clothes.save!
end

puts 'Creating 50 Shoe...'
50.times do
  shoe = Item.new(
    category: Category.find_by(name: "Shoe"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Shoe #{Faker::Code.ean}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500)
  )
  shoe.save!
end

puts 'Creating 50 Hat...'
50.times do
  hat = Item.new(
    category: Category.find_by(name: "Hat"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Hat #{Faker::Code.ean}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500)
  )
  hat.save!
end

puts 'Creating All Foods...'

  tuna = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Tuna",
    name: "tuna",
    nft: Faker::Blockchain::Ethereum.address,
    value: 100
  )
  tuna.save!

  sardine = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Sardine",
    name:"sardine",
    nft: Faker::Blockchain::Ethereum.address,
    value: 50
  )
  sardine.save!

  lobster = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Lobster",
    name: "lobster",
    nft: Faker::Blockchain::Ethereum.address,
    value: 200
  )
  lobster.save!

  salmon = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Salmon",
    name: "salmon",
    nft: Faker::Blockchain::Ethereum.address,
    value: 150
  )
  salmon.save!

  shrimp = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Shrimp",
    name: "shrimp",
    nft: Faker::Blockchain::Ethereum.address,
    value: 50
  )
  shrimp.save!

puts 'Finished!'
