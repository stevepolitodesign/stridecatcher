require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:confirmed_user_with_activities)
    @activity = @user.activities.last
  end

  test "should create activity and calculate pace" do
    sign_in @user

    visit new_activity_path

    fill_in "Distance", with: "10.0"
    select "Miles"
    fill_in "Hours", with: "1"
    fill_in "Minutes", with: "10"
    fill_in "Seconds", with: "0"

    click_button "Create Activity"

    assert_selector "span", text: "00:07:00"
  end

  test "should update activity" do
    sign_in @user

    visit edit_activity_path(@activity)
    fill_in "Distance", with: "320.11"
    select "Meters"

    click_button "Update Activity"

    assert_selector "p", text: "Updated Activity"
  end
  
  test "should delete activity" do
    sign_in @user

    visit edit_activity_path(@activity)
    accept_alert do
      click_link "Delete"
    end

    assert_selector "p", text: "Activity Deleted"
  end  
end
