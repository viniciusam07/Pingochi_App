require 'faker'

puts "Destroying old seed"
Item.destroy_all
Category.destroy_all

puts 'Creating Item Categories...'
category_types = ["Igloo", "Fishing Rods", "Hat", "Food"]
category_types.each do |category|
  Category.create!(name: category)
end

puts 'Creating 30 igloos...'
50.times do
  igloo = Item.new(
    category: Category.find_by(name: "Igloo"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Igloo",
    name:"Igloo #{Faker::JapaneseMedia::DragonBall.race} #{Faker::JapaneseMedia::DragonBall.planet}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500),
    image_url: ["igloo_1.jpg", "igloo_2.jpg", "igloo_3.jpg", "igloo_4.jpg"].sample
  )
  igloo.save!
end


puts 'Creating 20 Fishing Rods...'
50.times do
  fishing_rods = Item.new(
    category: Category.find_by(name: "Fishing Rods"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Fishing Rod",
    name:"Fishing Rod #{Faker::JapaneseMedia::Doraemon.location}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500),
    image_url: ["fish_rod_1.jpg", "fish_rod_2.jpg", "fish_rod_3.jpg"].sample
  )
  fishing_rods.save!
end

puts 'Creating 15 Hat...'
50.times do
  hat = Item.new(
    category: Category.find_by(name: "Hat"),
    description: " #{Faker::Games::Zelda.character} #{Faker::Games::Pokemon.move} Hat",
    name:"Hat #{Faker::Movies::LordOfTheRings.character}",
    nft: Faker::Blockchain::Ethereum.address,
    value: rand(100..500),
    image_url: ["hat_1.jpg", "hat_2.jpg", "hat_3.jpg", "hat_4.jpg", "hat_5.jpg"].sample
  )
  hat.save!
end

puts 'Creating All Foods...'

  tuna = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Tuna",
    name: "tuna",
    nft: Faker::Blockchain::Ethereum.address,
    value: 100,
    image_url: "tuna.jpg"
  )
  tuna.save!

  sardine = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Sardine",
    name:"sardine",
    nft: Faker::Blockchain::Ethereum.address,
    value: 50,
    image_url: "sardine.jpg"
  )
  sardine.save!

  lobster = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Lobster",
    name: "lobster",
    nft: Faker::Blockchain::Ethereum.address,
    value: 200,
    image_url: "lobster.jpg"
  )
  lobster.save!

  salmon = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Salmon",
    name: "salmon",
    nft: Faker::Blockchain::Ethereum.address,
    value: 150,
    image_url: "salmon.jpg"
  )
  salmon.save!

  shrimp = Item.new(
    category: Category.find_by(name: "Food"),
    description: " Fresh Shrimp",
    name: "shrimp",
    nft: Faker::Blockchain::Ethereum.address,
    value: 50,
    image_url: "shrimp.jpg"
  )
  shrimp.save!

puts 'Finished!'

require "open-uri"

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
user = User.new(title: 'NES', body: "A great console")
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
