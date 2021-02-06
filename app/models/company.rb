class Company < ApplicationRecord
  has_many :users
  has_one :vision
  has_many :strategies
end
