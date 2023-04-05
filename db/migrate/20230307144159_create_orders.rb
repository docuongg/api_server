class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :description
      t.float :price
      
      t.timestamps
    end
  end
end
