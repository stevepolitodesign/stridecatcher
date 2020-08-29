require 'test_helper'

class NotifyUserMailerTest < ActionMailer::TestCase
  def setup
    @shoe = shoes(:confirmed_user_with_shoes_shoe)
  end

  test "shoe_mileage_reached" do
    mail = NotifyUserMailer.shoe_mileage_reached(@shoe)
    assert_equal "Time to change your shoes!", mail.subject
    assert_equal [@shoe.user.email], mail.to
    assert_equal ["notifications@stridecatcher.com"], mail.from
    assert_match @shoe.name, mail.body.encoded
    assert_match @shoe.distance_in_miles.to_s, mail.body.encoded
  end

end
