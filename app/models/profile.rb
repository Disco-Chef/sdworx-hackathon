class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_one :chosen_vision
  has_many :bad_guys, through: :profile

  has_many :chosen_strategies
  has_many :quests
  has_many :bad_guys
  has_many :power_ups

  ORIGIN_STORIES = [
    "$NICKNAME had parents murdered by one of the muggers when he was young while walking home from the movies with their parents. Later discovered that their city was plagued by corrupt officials, inspired them to used their vast family fortune to become $NICKNAME and wage a one-person war on crime.",
    "Born on the planet Krypton, infant $NICKNAME was sent to Earth before an explosion destroyed their home planet. Their strong moral code motivates them to fight for justice.",
    "$NICKNAME was once an ordinariy human child, having scientist parents that injected them with reverse evolution serum to save their life from a deadly virus which led to the start of their superhero career.",
    "$NICKNAME was once either an intermediate dinosaur or a prehistoric intermediate reptile who was later transformed into a giant monster by the nuclear test that damaged their original home",
    "Originally an orphaned cat. They both stole different types of beans in the search of the magic beans. After some time, $NICKNAME gave up stealing things. But their crime buddies, unable to steal without the cat's help, tricked them into a bank robbery. From then on, $NICKNAME became a fugitive from law, searching a way to clear their name",
    "$NICKNAME, a Saiyan baby was sent from Planet Vegeta to Earth to destroy it, but ended up having a nasty bump on the head, which causes them to completely lose their Saiyan characteristics and become an Earthling.",
    "$NICKNAME was the chosen one to fight all that is evil, although they were separated from their parents during war. For a brief period of time, they went down to a darker path until eventually choose to redeem themselves, starting their adventures as a hero.",
    "Originally, Officer Sam Weathers was killed in the line of duty and brought back to life as a crime-fighting cyborg called $NICKNAME"
  ]

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

  def self.get_random_story(nickname)
    ORIGIN_STORIES.sample.gsub("$NICKNAME", nickname)
  end

end
