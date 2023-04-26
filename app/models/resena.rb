class Resena < ApplicationRecord
  validates :titulo, presence: true
  validates :cuerpo, presence: true
  belongs_to :libro
  belongs_to :user
end
