class Category < ApplicationRecord
  TYPES = ["Iglu", "Cachecol", "Varas", "Roupas", "Sapato", "Chapeu", "Comida"]
  has_many :itens
  has_one_attached :photo
end
