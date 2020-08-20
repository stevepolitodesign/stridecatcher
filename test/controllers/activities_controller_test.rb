require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user_one = users(:confirmed_user_with_activities)
    @user_two = users(:another_confirmed_user_with_activities)

    @user_one_activity = @user_one.activities.first
    @user_two_activity = @user_two.activities.first
  end

  test "should not delete another users activity" do
    sign_in @user_one

    assert_no_difference("Activity.count") do
      delete activity_path(@user_two_activity)
    end
  end

  test "should not update another users activity" do
    sign_in @user_one
    new_duration = 1

    put activity_path(@user_two_activity), params: { activity: { duration: new_duration } }
    assert_not_equal @user_two_activity.reload.duration, new_duration
  end

  test "should not get show for another users actvity" do
    sign_in @user_one
    
    get activity_path(@user_two_activity)
    assert_redirected_to root_path
  end
end
