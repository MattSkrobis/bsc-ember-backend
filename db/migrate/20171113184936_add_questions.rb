class AddQuestions < ActiveRecord::Migration[5.1]
    def change
      create_table :questions do |t|
        t.text :description
   
        t.timestamps
      end
    end
end
