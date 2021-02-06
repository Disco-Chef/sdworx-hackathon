class ChosenStrategy < ApplicationRecord
  belongs_to :profile
  belongs_to :strategy
end
