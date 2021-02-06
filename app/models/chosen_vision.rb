class ChosenVision < ApplicationRecord
  belongs_to :profile
  belongs_to :vision

  has_many :power_up_visions
  has_many :power_ups, through: :power_up_visions
end
