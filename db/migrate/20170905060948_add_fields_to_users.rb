class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
    add_column :users, :gender, :string
    add_column :users, :telephone_number, :string
  end
end
