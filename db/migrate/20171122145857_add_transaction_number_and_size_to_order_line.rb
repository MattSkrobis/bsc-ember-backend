class AddTransactionNumberAndSizeToOrderLine < ActiveRecord::Migration[5.1]
  def change
    add_column :order_lines, :transaction_number, :string
    add_column :order_lines, :size, :string
  end
end
