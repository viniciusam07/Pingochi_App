class AddColumnToPingochis < ActiveRecord::Migration[6.0]
  def change
    add_column :pingochis, :specie, :string
  end
end
