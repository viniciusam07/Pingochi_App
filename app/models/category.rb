class Category < ApplicationRecord
  TYPES = ["Igloo", "Scarf", "Sticks", "Clothes", "Shoe", "Hat", "Food"]
  has_many :itens
  has_one_attached :photo
end
