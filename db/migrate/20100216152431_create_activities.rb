class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.boolean :public
      t.integer :item_id
      t.string :item_type
      t.integer :user_id
      t.string :preview
      t.timestamps
    end
  end
  
  def self.down
    drop_table :activities
  end
end
