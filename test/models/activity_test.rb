require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @user = users(:confirmed_user)
    @activity = @user.activities.build(date: Time.zone.now, duration: 1)
  end

  test "should be valid" do
    assert @activity.valid?
  end

  test "should have date" do
    @activity.date = nil
    assert_not @activity.valid?
  end

  test "duration should be positive" do
    @activity.duration = -1
    assert_not @activity.valid?

    @activity.duration = 0
    assert_not @activity.valid?
  end

  test "distance should be positive" do
    @activity.distance = -1
    assert_not @activity.valid?    
  end
  
  test "should have distance or duration" do
    @activity.distance = nil
    @activity.duration = nil

    assert_not @activity.valid?
  end

  test "should have unit if distance is set" do
    @activity.distance = 1
    @activity.unit = nil

    assert_not @activity.valid?
  end
end