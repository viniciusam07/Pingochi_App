class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_reference :items, :category, null: false, foreign_key: true
  end
end
