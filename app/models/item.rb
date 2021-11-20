class Item < ApplicationRecord
  has_many :itens
  belongs_to :category
  has_many_attached :photos

end
