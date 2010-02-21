# == Schema Information
#
# Table name: activities
#
#  id         :integer(4)      not null, primary key
#  public     :boolean(1)
#  item_id    :integer(4)
#  item_type  :string(255)
#  user_id    :integer(4)
#  preview    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Activity < ActiveRecord::Base
#  attr_accessible :public, :item_id, :item_type, :user_id, :preview
  belongs_to :item, :polymorphic => true
  belongs_to :user
  has_many :feeds
end

