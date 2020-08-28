require 'test_helper'

class ShoeTest < ActiveSupport::TestCase

  def setup
    @user = users(:confirmed_user)
    @shoe = @user.shoes.build(name: "shoe")
  end

  test "should be valid" do
    assert @shoe.valid?
  end

  test "should have a name" do
    @shoe.name = ""
    assert_not @shoe.valid?
  end

  test "allowed_distance_in_miles should be greater than 0" do
    @shoe.allowed_distance_in_miles = 0
    assert_not @shoe.valid?

    @shoe.allowed_distance_in_miles = -1
    assert_not @shoe.valid?    
  end
end
