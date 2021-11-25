class AddNicknameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nick_name, :string
  end
end
