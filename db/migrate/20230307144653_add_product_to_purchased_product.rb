class AddProductToPurchasedProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchased_products, :product, null: false, foreign_key: true
  end
end
