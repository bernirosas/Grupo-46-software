class Mensaje < ApplicationRecord
  validates :texto, presence: true
  belongs_to :user
  belongs_to :libro
end
