class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.references :pingochi1, null: false, references: :pingochis, foreign_key: { to_table: :pingochis }
      t.references :pingochi2, null: false, references: :pingochis, foreign_key: { to_table: :pingochis }
      t.references :pingochi_winner, null: false, references: :pingochis, foreign_key: { to_table: :pingochis }
      t.timestamps
    end
  end
end
