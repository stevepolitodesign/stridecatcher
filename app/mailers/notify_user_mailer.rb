class NotifyUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify_user_mailer.shoe_mileage_reached.subject
  #
  def shoe_mileage_reached(shoe)
    @shoe = shoe
    @user = @shoe.user
    @message = "Your #{@shoe.name} has #{@shoe.distance_in_miles} miles on it."

    mail to: @user.email, subject: "Time to change your shoes!"
  end
end
