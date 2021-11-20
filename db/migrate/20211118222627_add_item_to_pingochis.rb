class AddItemToPingochis < ActiveRecord::Migration[6.0]
  def change
    add_reference :pingochis, :item, foreign_key: true
  end
end
