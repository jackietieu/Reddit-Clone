class CreatePostSubs < ActiveRecord::Migration
  def change
    create_table :post_subs do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false
      t.index :sub_id
      t.index :post_id
      t.timestamps null: false
    end
  end
end
