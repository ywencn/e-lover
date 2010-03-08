class Group < ActiveRecord::Base
 # attr_accessible :name, :introduction, :admin_id
  index :id

  has_many :posts
  belongs_to :admin, :class_name =>"User" ,:foreign_key =>"admin_id"
  has_many :members, :class_name =>"User" 
  has_and_belongs_to_many :users
end
