class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :description
      t.float :total_price
      t.integer :status
      
      t.timestamps
    end
  end
end
