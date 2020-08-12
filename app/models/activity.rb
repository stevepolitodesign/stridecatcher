class Activity < ApplicationRecord
    belongs_to :user

    enum category: [:run, :long_run, :workout, :race, :other]
    enum difficulty: [:easy, :moderate, :hard]
    enum unit: [:miles, :kilometers, :meters, :yards]

    validates :date, presence: true
end
