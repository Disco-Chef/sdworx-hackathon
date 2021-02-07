class PowerUp < ApplicationRecord
  belongs_to :profile

  validates :name, presence: true
  validates :description, presence: true
  validates :xp, presence: true
end
