class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :unit
      t.float :price
      t.string :thumbnail_url
      
      t.timestamps
    end
  end
end
