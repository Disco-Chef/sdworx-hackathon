class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_one :chosen_vision
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

  def total_xp
    total_quests_xp = 0
    completed_quests = self.completed_quests
    completed_quests.each do |completed_quest|
      total_quests_xp += completed_quest.xp
    end

    total_bad_guys_xp = 0
    current_user.profile.bad_guys.each do |bad_guy|
      total_bad_guys_xp += bad_guy.total_xp
    end

    total_power_ups_xp = 0
    current_user.profile.power_ups.each do |power_up|
      total_power_ups_xp += power_up.total_xp
    end

    return quest_xp + total_bad_guys_xp + total_power_ups_xp
  end
end
