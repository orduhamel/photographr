class Client < ApplicationRecord
  belongs_to :user
  has_many :prestations, dependent: :destroy
  has_one_attached :photo
end
