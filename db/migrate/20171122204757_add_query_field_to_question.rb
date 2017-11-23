class AddQueryFieldToQuestion < ActiveRecord::Migration[5.1]
    def change
        add_column :questions, :query_field, :string
      end
end
