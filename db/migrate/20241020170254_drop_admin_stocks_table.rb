class DropAdminStocksTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :admin_stocks
  end

  def down
    create_table :admin_stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :amount
      t.string :size
      t.timestamps
    end
  end
end
