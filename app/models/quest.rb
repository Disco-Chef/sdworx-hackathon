class Quest < ApplicationRecord
  belongs_to :profile
  has_many :quest_strategies
  has_many :chosen_strategy, through: :quest_strategies
  accepts_nested_attributes_for :quest_strategies
end
