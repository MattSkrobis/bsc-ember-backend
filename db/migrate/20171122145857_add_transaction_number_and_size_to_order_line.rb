class AddTransactionNumberAndSizeToOrderLine < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :transaction_number, :string
    add_column :orders, :discount, :decimal
    add_column :orders, :total, :decimal
    add_column :orders, :courier, :string
    add_column :orders, :price_after_discount, :decimal
    add_column :order_lines, :size, :string
  end
end
