class Beaver < ApplicationRecord
  validates :cuteness, comparison: {equal_to: 10, message: "It's impossible to have a beaver with less than 10 cuteness"}
end
