class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :comments_count ,:default => 0
      t.integer :user_id
      t.integer :last_replid_user_id
      t.datetime :last_replid_time
      t.boolean :publish_to_blog
      t.integer :group_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :posts
  end
end
