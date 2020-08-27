class Shoe < ApplicationRecord
    belongs_to :user
    has_many :activities

    validates :name, presence: true
    validates :allowed_distance_in_miles, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }
end
