class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :quests
  has_many :bad_guys
  has_many :power_ups


  def current_quests
    self.quests.where(completed: false)
  end

  def completed_quests
    self.quests.where(completed: true)
  end

end
