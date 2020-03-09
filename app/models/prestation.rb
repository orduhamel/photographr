class Prestation < ApplicationRecord
  belongs_to :client
  has_many :tasks
end
