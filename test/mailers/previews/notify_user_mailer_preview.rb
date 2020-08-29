# Preview all emails at http://localhost:3000/rails/mailers/notify_user_mailer
class NotifyUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notify_user_mailer/shoe_mileage_reached
  def shoe_mileage_reached
    @shoe = Shoe.last
    NotifyUserMailer.shoe_mileage_reached(@shoe)
  end

end
