class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name, null: false, default: ""
      t.date :date, null: false, default: "" 
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
