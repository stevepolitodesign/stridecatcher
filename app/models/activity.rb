class Activity < ApplicationRecord
    belongs_to :user

    enum category: [:run, :long_run, :workout, :race, :other]
    enum difficulty: [:easy, :moderate, :hard]
    enum unit: [:miles, :kilometers, :meters, :yards]

    validates :date, presence: true
    validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }
    validates :distance, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
    validate :require_distance_or_duration
    validate :require_unit_if_distance_set

    private

        def require_distance_or_duration
            errors.add(:base, "Please add a distance or duration") if self.distance.nil? && self.duration.nil? 
        end

        def require_unit_if_distance_set
            errors.add(:base, "Please select a unit") if self.distance.present? && self.unit.nil? 
        end
end
