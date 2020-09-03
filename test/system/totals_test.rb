require "application_system_test_case"

class TotalsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:confirmed_user)
  end

  test "creating weekly mileage" do
    sign_in @user

    travel_to Time.zone.now.beginning_of_week
    create_activity

    travel_to Time.zone.now.beginning_of_week + 1.day
    create_activity

    visit totals_path
    @total = @user.totals.last
    assert_text "#{@total.starting_on.strftime("%D")} through #{@total.starting_on.end_of_week.strftime("%D")}"
    assert_text @total.distance_in_miles
    assert_text "02:20:00"

    take_screenshot
  end

  private
    def create_activity
      visit new_activity_path

      fill_in "Distance", with: "10.0"
      select "Miles"
      fill_in "Hours", with: "1"
      fill_in "Minutes", with: "10"
      fill_in "Seconds", with: "0"
  
      click_button "Create Activity"
    end 

end
