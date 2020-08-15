class Activity < ApplicationRecord
    self.ignored_columns = ["pace"]
    belongs_to :user

    enum category: [:run, :long_run, :workout, :race, :other]
    enum difficulty: [:easy, :moderate, :hard]
    enum unit: [:miles, :kilometers, :meters, :yards]

    has_rich_text :description

    before_save :calculate_pace

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

        def calculate_pace
            if self.unit.present? && self.distance.present? && self.duration.present?
                case self.unit
                when "miles"
                    self.calculated_pace = self.duration / self.distance
                when "kilometers"
                    converted_distance = self.distance * 0.6213712
                    self.calculated_pace = self.duration / converted_distance
                when "meters"
                    converted_distance = self.distance * 0.0006213711985
                    self.calculated_pace = self.duration / converted_distance
                when "yards"
                    converted_distance = self.distance * 0.0005681818239083977
                    self.calculated_pace = self.duration / converted_distance
                end
            end
        end
end
