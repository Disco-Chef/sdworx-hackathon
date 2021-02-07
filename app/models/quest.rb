class Quest < ApplicationRecord
  belongs_to :profile
  has_many :quest_strategies
  has_many :chosen_strategies, through: :quest_strategies
  accepts_nested_attributes_for :quest_strategies

  validates :name, presence: true
  validates :completion_rate, presence: true
  validates :description, presence: true
  validates :xp, presence: true
end
