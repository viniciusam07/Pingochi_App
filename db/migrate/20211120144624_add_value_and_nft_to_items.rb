class AddValueAndNftToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :value, :integer
    add_column :items, :nft, :string
  end
end
