class Track < ActiveRecord::Base
  
  index [:item_id, :item_type]
  
  belongs_to :item ,
             :polymorphic => true
  belongs_to :user
  
  validates_presence_of :user_id
  validates_presence_of :item_id
  validates_presence_of :item_type
  
end
