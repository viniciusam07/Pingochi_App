class Category < ApplicationRecord
  TYPES = ["Igloo", "Scarf", "Fishing rod", "Clothes", "Shoes", "Hat", "Food"]
  has_many :itens
  has_one_attached :photo
end
