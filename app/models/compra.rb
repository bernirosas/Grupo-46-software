class Compra < ApplicationRecord
  validates :estado, presence: true
  belongs_to :user
  belongs_to :libro
end
