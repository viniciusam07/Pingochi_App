class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :fishcoin_amount, null: false, default: 1000

      t.timestamps
    end
  end
end
