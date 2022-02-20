class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer   :user_id, null: false
      t.string    :title,   null: false, default: ""
      t.text      :body,    null: false, default: ""

      t.timestamps
    end
  end
end