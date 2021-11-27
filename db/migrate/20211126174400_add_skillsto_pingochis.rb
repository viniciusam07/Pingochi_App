class AddSkillstoPingochis < ActiveRecord::Migration[6.0]
  def change
    add_column :pingochis, :strength_skill, :integer, null: false, default: 0
    add_column :pingochis, :inteligence_skill, :integer, null: false, default: 0
    add_column :pingochis, :speed_skill, :integer, null: false, default: 0
  end
end
