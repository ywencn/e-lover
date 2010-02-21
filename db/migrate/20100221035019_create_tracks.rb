class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :user_id
      t.string :item_type
      t.integer :item_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tracks
  end
end
