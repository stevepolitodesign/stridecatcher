require "application_system_test_case"

class ShoesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:confirmed_user_with_shoe)
  end

  test "creating a new shoe" do
    sign_in @user
    
    visit new_shoe_path

    fill_in "Name", with: "Shoe"
    fill_in "Notifiy me when my shoe hits this mileage", with: 100
    click_button "Create Shoe"

    assert_text "Shoe Created"    
  end
end
