class ChosenStrategy < ApplicationRecord
  belongs_to :profile
  belongs_to :strategy

  has_many :quest_strategies
  has_many :quests, through: :quest_strategies
end
