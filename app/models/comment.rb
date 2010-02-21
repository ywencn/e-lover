# == Schema Information
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  item_id    :integer(4)
#  item_type  :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  include ActivityLogger
  
  belongs_to :user
  belongs_to :item ,
             :counter_cache => :comments_count, 
             :polymorphic => true
             
  attr_accessible :user_id, :body, :item_id, :item_type
  
  after_create :log_activity
private
   def log_activity
     add_activities(:item => self, :user => self.user)
   end
end

