class BadGuy < ApplicationRecord
  belongs_to :profile
  validates :name, presence: true, uniqueness: { scope: :profile }
  validates :story, presence: true
  validates :xp, presence: true
end
