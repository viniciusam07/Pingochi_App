class CreateInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :user, foreign_key: true
      t.references :pingochi, null: false, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
