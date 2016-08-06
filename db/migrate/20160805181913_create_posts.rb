class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.integer :sub_id, null: false
      t.integer :user_id, null: false
      t.index :sub_id
      t.index :user_id
      t.timestamps null: false
    end
  end
end
