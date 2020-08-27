class Shoe < ApplicationRecord
    belongs_to :activity, optional: true
end
