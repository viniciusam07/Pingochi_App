class CreateMatings < ActiveRecord::Migration[6.0]
  def change
    create_table :matings do |t|
      t.references :pingochi1, null: false, references: :pingochis, foreign_key: { to_table: :pingochis }
      t.references :pingochi2, null: false, references: :pingochis, foreign_key: { to_table: :pingochis }
      t.boolean :mating_status, null: false
      t.timestamps
    end
  end
end
