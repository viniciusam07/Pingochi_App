class AddSleepTimeToPingochi < ActiveRecord::Migration[6.0]
  def change
    add_column :pingochis, :slept_at, :timestamp
  end
end
