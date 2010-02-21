class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.string :introduction
      t.integer :admin_id
      t.integer :posts_count ,:default => 0
      t.timestamps
    end
  end
  
  def self.down
    drop_table :groups
  end
end
