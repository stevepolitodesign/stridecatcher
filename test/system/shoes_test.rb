require "application_system_test_case"

class ShoesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:confirmed_user_with_shoe)
    @shoe = shoes(:confirmed_user_with_shoes_shoe)
  end

  test "creating a new shoe" do
    sign_in @user
    
    visit new_shoe_path

    fill_in "Name", with: "Shoe"
    fill_in "Notifiy me when my shoe hits this mileage", with: 100
    click_button "Create Shoe"

    assert_text "Shoe Created"    
  end

  test "creating a new shoe without a entering a value for allowed_distance_in_miles" do
    sign_in @user
    
    visit new_shoe_path

    fill_in "Name", with: "Shoe"
    click_button "Create Shoe"

    assert_text "Shoe Created"    
  end  

  test "rendering form errors" do
    sign_in @user
    
    visit new_shoe_path
    click_button "Create Shoe"

    assert_selector "#form_errors"
    take_screenshot
  end

  test "updating a shoe" do
    sign_in @user
    
    visit edit_shoe_path(@shoe)
    fill_in "Name", with: "Update Shoe"
    check "Retired"
    click_button "Update Shoe"

    assert_text "Shoe Update"
    take_screenshot
  end
  
  test "deleting a shoe" do
    sign_in @user
    
    visit edit_shoe_path(@shoe)
    accept_alert do
      click_link "Delete"
    end

    assert_text "Shoe Deleted"
    take_screenshot
  end  
end
