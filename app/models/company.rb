class Company < ApplicationRecord
  has_many :users
  has_one :vision
  has_many :strategies
  has_many :company_bad_guys
  has_many :company_quests
  has_many :company_power_ups
end
