class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :sku
      t.decimal :price
      t.boolean :availability
      t.string :currency
      t.integer :quantity

      t.timestamps
    end
  end
end
