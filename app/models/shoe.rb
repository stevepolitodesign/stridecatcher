class Shoe < ApplicationRecord
    belongs_to :user
    has_many :activities

    validates :name, presence: true
    validates :allowed_distance_in_miles, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }

    after_save :notify_user, if: :user_should_be_notified?

    private

        def notify_user
            NotifyUserMailer.shoe_mileage_reached(self.user).deliver_now
            self.notified = true
        end

        def user_should_be_notified?
            !self.notified? && self.distance_in_miles >= self.allowed_distance_in_miles
        end

end
