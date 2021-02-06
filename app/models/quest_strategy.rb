class QuestStrategy < ApplicationRecord
  belongs_to :quest
  belongs_to :chosen_strategy
end
