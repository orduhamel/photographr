class Client < ApplicationRecord
  belongs_to :user
  has_many :prestations, dependent: :destroy
  has_many :tasks, through: :prestations

  has_one_attached :photo

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
