class CreatePurchasedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_products do |t|
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
