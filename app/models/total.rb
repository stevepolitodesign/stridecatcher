class Total < ApplicationRecord
  belongs_to :user

  scope :ordered, -> { order(starting_on: :desc) }

  enum range: [:week]

  validates :starting_on, :range, presence: true
  validates_uniqueness_of :user, scope: [:starting_on, :range]
end
