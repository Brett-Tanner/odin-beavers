class Beaver < ApplicationRecord
  validates :cuteness, comparison: {equal_to: 10}
end
