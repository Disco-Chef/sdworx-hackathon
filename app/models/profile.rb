class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_one :chosen_vision
  has_many :bad_guys, through: :profile

  has_many :chosen_strategies
  has_many :quests
  has_many :bad_guys
  has_many :power_ups

  def current_quests
    self.quests.where(completed: false)
  end

  def completed_quests
    self.quests.where(completed: true)
  end

  def completed_quests_xp
    completed_quests.sum(&:xp)
  end

  def bad_guys_xp
    bad_guys.sum(&:total_xp)
  end

  def total_power_ups_xp
    power_ups.sum(&:total_xp)
  end

  def total_xp
    return completed_quests_xp + bad_guys_xp + total_power_ups_xp || 0
  end

end
