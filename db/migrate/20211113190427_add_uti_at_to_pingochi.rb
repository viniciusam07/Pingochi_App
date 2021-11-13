class AddUtiAtToPingochi < ActiveRecord::Migration[6.0]
  def change
    add_column :pingochis, :uti_at, :timestamp
  end
end
