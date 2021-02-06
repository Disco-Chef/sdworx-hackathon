class Company < ApplicationRecord
  has_one :vision
  has_many :strategies
end
