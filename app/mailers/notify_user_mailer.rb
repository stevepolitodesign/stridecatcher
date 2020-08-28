class NotifyUserMailer < ApplicationMailer
    default from: 'notifications@stridecatcher.com'
 
    def shoe_mileage_reached(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
