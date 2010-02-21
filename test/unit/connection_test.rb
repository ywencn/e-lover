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

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Connection.new.valid?
  end
end
