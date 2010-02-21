class AddReadCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :read_count, :integer, :default=>0
  end

  def self.down
    remove_column :posts, :read_count
  end
end
