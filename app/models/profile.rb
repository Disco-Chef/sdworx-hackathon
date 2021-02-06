class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_one :chosen_vision
  has_many :chosen_strategies
end
