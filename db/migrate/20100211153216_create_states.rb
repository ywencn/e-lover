class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.integer :user_id
      t.string :body
      t.integer :comments_count,:default=>0
      t.timestamps
    end
    add_index :states, :user_id
  end
  
  def self.down
    drop_table :states
  end
end
