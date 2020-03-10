class Prestation < ApplicationRecord
  CATEGORIES = ['Mariage', 'Famille', 'Entreprise']
  STATUS = ['en cours', 'terminé']

  belongs_to :client
  has_many :tasks

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
