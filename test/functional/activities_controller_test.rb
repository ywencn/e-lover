require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  def test_destroy
    activity = Activity.first
    delete :destroy, :id => activity
    assert_redirected_to root_url
    assert !Activity.exists?(activity.id)
  end
end
