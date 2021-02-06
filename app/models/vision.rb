class Vision < ApplicationRecord
  belongs_to :company
  has_many :chosen_visions
  has_many :profiles, through: :chosen_visions
end
