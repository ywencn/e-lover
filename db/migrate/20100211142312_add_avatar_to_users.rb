class AddAvatarToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar, :boolean
  end

  def self.down
    remove_column :users, :avatar
  end
end
