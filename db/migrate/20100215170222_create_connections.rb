class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.integer :be_followed_id
      t.integer :follower_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :connections
  end
end
