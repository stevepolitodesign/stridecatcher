require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:confirmed_user_with_activities)
    @user_with_shoe = users(:confirmed_user_with_shoe)
    @shoe = shoes(:confirmed_user_with_shoes_shoe)
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

    assert_text "00:07:00"
  end

  test "should update activity" do
    sign_in @user

    visit edit_activity_path(@activity)
    fill_in "Distance", with: "320.11"
    select "Meters"

    click_button "Update Activity"

    assert_text "Updated Activity"
  end
  
  test "should delete activity" do
    sign_in @user

    visit edit_activity_path(@activity)
    accept_alert do
      click_link "Delete"
    end

    assert_text "Activity Deleted"
  end

  test "should render form errors" do
    sign_in @user

    visit new_activity_path
    click_button "Create Activity"

    assert_selector "#form_errors"
  end

  test "should paginate activities" do
    sign_in @user

    visit activities_path
    click_link "Next"
    click_link "Prev"
  end

  test "should search activities" do
    @user = users(:confirmed_user_with_searchable_activities)
    
    sign_in @user

    visit activities_path
    select "Hard"
    click_button "Search"

    within "table" do
      assert_text "Hard", count: 2
      assert_text "Moderate", count: 0
      assert_text "Easy", count: 0
    end

    click_link "Reset"

    fill_in "Description includes", with: "million"
    click_button "Search"

    within "table" do
      assert_text "Hard", count: 1
      assert_text "Moderate", count: 0
      assert_text "Easy", count: 0
    end

    click_link "Reset"
    
    fill_in "Description includes", with: "should not yeild results"
    click_button "Search"

    assert_text "No results."
  end

  test "should set shoe when creating an activity" do
    sign_in @user_with_shoe

    visit new_activity_path

    fill_in "Distance", with: "10.0"
    select "Miles"
    select "#{@shoe.name_with_miles}"

    click_button "Create Activity"

    assert_text "Created Activity"
  end
  
  test "should create shoe" do
    sign_in @user

    visit new_activity_path

    click_button "Add Shoe"
    within "#new_shoe" do
      fill_in "Name", with: "Foo Bar Baz"
      click_button "Create Shoe"
    end

    within "#activity_shoe_id" do
      assert_text "Foo Bar Baz (0.0 miles)"
    end
  end

  test "should render form errors when creating shoe" do
    sign_in @user

    visit new_activity_path

    click_button "Add Shoe"
    within "#new_shoe" do
      click_button "Create Shoe"
      assert_selector "#form_errors"
    end
  end  
end
