class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :nombre, presence: true
  validates :telefono, presence: true
  validates :descripcion, presence: true
  validates :tipo_de_usuario, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resenas, dependent: :destroy
  has_many :mensajes, dependent: :destroy
  has_many :compras, dependent: :destroy

end
