QuestStrategy.destroy_all
Quest.destroy_all
BadGuy.destroy_all
PowerUp.destroy_all
ChosenVision.destroy_all
ChosenStrategy.destroy_all
Profile.destroy_all

User.destroy_all
Strategy.destroy_all
Vision.destroy_all
Company.destroy_all

company = Company.create!(name: "The Newsroom")

user_charlie = User.create!(
  email: "charlie@newsroom.com",
  password: "123123",
  company: company
)
user_will = User.create!(
  email: "will@newsroom.com",
  password: "123123",
  company: company
)
vision = "To be the company that best understands and satisfies the product, service and self-fulfillment needs of people globally"
Vision.create company: company, name: vision

strategies = ["Grow shareholder value", "Best value for the cost", "    Acquire new customers from innovative offerings", "    Improve employee retention"]
strategies.each do |strategy|
  Strategy.create company: company, name: strategy
end

profile = Profile.create!(user: user_will, nickname: "Spider-Man", secret_bio: "As a young man, I was bittne by a radio-active re-engineered-dna spider. I have at first played with my new powers by making web softwares left and right just for money. But then, something really important happened, so I decided to work on my spidey-software skills to be the best spider-engineer I can think of!" )

chosen_vision = Vision.first.chosen_visions.create!(motto: "We bring each other up and bring down those who aim to solely bring down others.", profile: profile)

power_up = chosen_vision.power_ups.create!(name: "The Giver of Sustenance", description: "Awarded for thinking of your buddies' food needs/wants and fulfilling them!", profile: profile, xp: 3, total_xp: 0)

chosen_strategy = Strategy.last.chosen_strategies.create!(profile: profile, personal_strategic_goal: "Set up measuring points to quantify retention and loss")

quest1 = chosen_strategy.quests.create!(name: "Seek Help", profile: profile, completion_rate: 0, xp: 5, completed: false, description: "Call for a crossover episode with Batman, Grey Cape and The Tick, to help with setting up the measurement methods!")

quest2 = chosen_strategy.quests.create!(name: "Give Help", profile: profile, completion_rate: 100, xp: 5, completed: true, description: "Superman wants some help with cleaning a dirty/unformatted csv!")

smoky_goblin = BadGuy.create!(name: "Ciggie Goblin", story: "Ciggie Goblin is always peer-pressuring you to go for a ciggie break. Resist his temptations!", profile: Profile.first, xp: 2, total_xp: 0)
