require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  def test_create_invalid
    Track.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Track.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end
  
  def test_destroy
    track = Track.first
    delete :destroy, :id => track
    assert_redirected_to root_url
    assert !Track.exists?(track.id)
  end
end
