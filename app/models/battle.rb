class Battle < ApplicationRecord
  belongs_to :pingochi1, class_name: "Pingochi"
  belongs_to :pingochi2, class_name: "Pingochi"
  belongs_to :pingochi_winner, class_name: "Pingochi"
end
