class Strategy < ApplicationRecord
  belongs_to :company
  has_many :chosen_strategies
  has_many :profiles, through: :chosen_strategies

  validates :name, presence: true
  validates :description, presence: true
end
