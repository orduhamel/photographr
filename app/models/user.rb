class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, dependent: :destroy
  has_many :prestations, through: :clients, dependent: :destroy

  has_one_attached :photo
end
