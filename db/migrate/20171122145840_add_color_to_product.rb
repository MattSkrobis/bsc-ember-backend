class AddColorToProduct < ActiveRecord::Migration[5.1]
    def change
        add_column :products, :color, :string
        add_column :products, :gender, :string
        add_column :products, :material, :string
      end
    end
  
