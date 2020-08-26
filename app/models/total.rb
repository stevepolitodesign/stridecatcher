class Total < ApplicationRecord
  belongs_to :user

  enum range: [:week]

  validates :starting_on, :range, presence: true
  validates_uniqueness_of :user, scope: [:starting_on, :range]
end
