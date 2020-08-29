class Shoe < ApplicationRecord
    belongs_to :user
    has_many :activities, dependent: :nullify

    validates :name, presence: true
    validates :allowed_distance_in_miles, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }

    after_save :notify_user, if: :user_should_be_notified?

    scope :alphabetized, -> { order(name: :asc) }
    scope :ordered, -> { order(retired: :asc) }
    scope :available, -> { where(retired: false) }

    def name_with_miles
        "#{self.name} (#{self.distance_in_miles} miles)"
    end

    private

        def notify_user
            NotifyUserMailer.shoe_mileage_reached(self).deliver_now
            self.notified = true
        end

        def user_should_be_notified?
            !self.notified? && !self.allowed_distance_in_miles.nil? && self.distance_in_miles >= self.allowed_distance_in_miles
        end

end
