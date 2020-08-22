class Total < ApplicationRecord
  belongs_to :user

  enum range: [:week]

  validates :starting_on, :range, presence: true
end
