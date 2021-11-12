class CreatePingochis < ActiveRecord::Migration[6.0]
  def change
    create_table :pingochis do |t|
      t.string :name, null: false
      t.boolean :live, null: false, default: true
      t.integer :age, null: false, default: 0
      t.string :gender, null: false
      t.integer :energy, null: false, default: 100
      t.string :nft, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
