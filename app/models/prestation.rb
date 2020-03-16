class Prestation < ApplicationRecord
  CATEGORIES = ['Mariage', 'Famille', 'Entreprise']
  STATUS = ['progress', 'finish']

  attr_accessor :new_client

  belongs_to :client
  has_many :tasks

  accepts_nested_attributes_for :client, reject_if: proc { |attributes| attributes[:first_name].blank? }


  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
