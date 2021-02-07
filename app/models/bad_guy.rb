class BadGuy < ApplicationRecord
  belongs_to :profile
  validates :name, presence: true
  validates :story, presence: true
  validates :xp, presence: true


end
