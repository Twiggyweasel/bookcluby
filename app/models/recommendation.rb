class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :book
end
