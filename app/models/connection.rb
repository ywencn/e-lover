# == Schema Information
#
# Table name: connections
#
#  id             :integer(4)      not null, primary key
#  be_followed_id :integer(4)
#  follower_id    :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

class Connection < ActiveRecord::Base
  attr_accessible :be_followed_id, :follower_id
  
  belongs_to :follower, :class_name=>"User",:foreign_key => "follower_id"
  belongs_to :followed_user,:class_name=>"User",:foreign_key => "be_followed_id"
end

