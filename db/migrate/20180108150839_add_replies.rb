class AddReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :body
      t.string :email
      t.integer :message_id
        
      t.timestamps
    end
  end
end
  