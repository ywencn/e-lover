# == Schema Information
#
# Table name: feeds
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  activity_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Feed < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
end

