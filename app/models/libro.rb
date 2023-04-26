class Libro < ApplicationRecord
  validates :titulo, presence: true
  validates :fecha, presence: true
  validates :categoria, presence: true
  validates :autor, presence: true
  validates :precio, presence: true
  validates :stock, presence: true
  validates :descripcion, presence: true
  has_many :resenas, dependent: :destroy
  has_many :mensajes, dependent: :destroy
  has_many :compras, dependent: :destroy
end
