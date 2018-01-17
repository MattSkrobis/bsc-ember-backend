class AddMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end
