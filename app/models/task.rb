class Task < ApplicationRecord
  KINDS = ['rendez-vous', 'admin', 'créa', 'évènement']

  belongs_to :prestation

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
