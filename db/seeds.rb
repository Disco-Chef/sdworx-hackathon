QuestStrategy.destroy_all
Quest.destroy_all
BadGuy.destroy_all
PowerUpVision.destroy_all
ChosenVision.destroy_all
PowerUp.destroy_all
ChosenStrategy.destroy_all
Profile.destroy_all

User.destroy_all
Strategy.destroy_all
Vision.destroy_all
CompanyBadGuy.destroy_all
CompanyQuest.destroy_all
CompanyPowerUp.destroy_all
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

CompanyBadGuy.create!(
  name: "Look-Over-Here Bee",
  story: "That pesky bee is always trying to distract me from my work with social media posts and gifs on 9gag. Resist the urge!",
  xp: 5,
  company: company
)
CompanyBadGuy.create!(
  name: "Dr Procrastinator",
  story: "That evil doctor is once again trying to appeal to your tiredness! Don't leave things for tomorrow that can be done today!",
  xp: 4,
  company: company
)
CompanyBadGuy.create!(
  name: "Tough-Love Tony ",
  story: "Tough-Love Tony has you thinking that people do not need/want praise for their work, especially when it is superficial but in fact what they want is tough love. To be pushed by guilt-tripping them. Alas, you now know better: The only way to fight hate/anger/negativity is with love! Defeat Tough-Love Tony by adding encouraging review notes in your employees' code-reviews!",
  xp: 5,
  company: company
)
CompanyBadGuy.create!(
  name: "Gossip-Giusepe",
  story: "Gossip-Giusepe, always sneaking into your HQ through light whispers, letting everyone know who crashed their car, or who made out with who at the office Holiday party. Renounce his advances and shut your ears to his words! Do not even re-transmit his whispers, for that is how he wins. Resist!",
  xp: 5,
  company: company
)
CompanyBadGuy.create!(
  name: "Sergei the Shopper",
  story: "You are trying to get work done, but Sergei is sometimes at the back of your mind, waiting for his moment to pounce and remind you how badly you need a coffee-table (even when you really don't need it) and that you need it right now this instant! He whispers words of online shops, in the interweb's ethereal realm, words like Amazon, Bol and Ebay. Put down ol' Sergei, and refrain from shopping online!",
  xp: 5,
  company: company
)

CompanyPowerUp.create!(
  name: "Fill out expense claims from this year's conferences I attended",
  description: "The folks down in the dev office haven't yet leveled up the priority of a feature automating this, should do it before the quarter's end to be reimbursed!!",
  xp: 8,
  company: company
)
CompanyPowerUp.create!(
  name: "Attach explanatory doc to presentation for boss",
  description: "Explaining to the boss in a separate doc step by step the presentation. It may be annoying, but she/he is not a dev, so I indulge them with this doc. Like this they will approve the funding for that project, no excuses!",
  xp: 7,
  company: company
)
CompanyPowerUp.create!(
  name: "Do Self Evaluation",
  description: "Boss doesn't have the time do make/write-up my evaluation. I can do it by myself and just have them sign it if they agree. I know it's hard to not be overly praising or belittling of my own work, but gotta get it done!",
  xp: 6,
  company: company
)


# "Grow shareholder value"
CompanyQuest.create!(
  name: "Increase unit price",
  description: "Boost our shareholder value by increasing unit prices. Keeping production quotas the same, profit generated increases.",
  xp: 4,
  company: company
)
CompanyQuest.create!(
  name: "Boost unit production",
  description: "Increase our shareholder value by expanding our production capabilities. DoublePin are going under and have offered to sell out their manufacturing plant at a discount. We would break even after 4 years, after which we will be selling many more units.",
  xp: 4,
  company: company
)
CompanyQuest.create!(
  name: "Improve fixed cost utilization and run the numbers",
  description: "Look into lead from BruEnergy and their more efficient new generators. This could be huge for us, decreasing our fixed energy cost by 8%, allegedly. We could sell the same product at the same price but it would cost us far less (if we replace all 14 generators) to produce! 💰",
  xp: 9,
  company: company
)

# "Best value for the cost"
CompanyQuest.create!(
  name: "Test products of supplier's new batch of staplers",
  description: "GrafMe is is offering to supply us with staplers of a new design, at a discounted price. Distribute samples to our heavy-stapler-users and get their feedback on quality. If it is the same or better, close re-supply deal with GrafMe. Otherwise, forward to them our findings and we go from there!",
  xp: 5,
  company: company
)

# "Acquire new customers from innovative offerings"
CompanyQuest.create!(
  name: "Get customers from the competition",
  description: "There is no reason we can't all get along. Find our how similar the competition is to us and who has them as a client. Go to that company and make them an offer to be an 'alternative' choice for their services!",
  xp: 7,
  company: company
)

# "Improve employee retention"
CompanyQuest.create!(
  name: "Vested employee interest in company with shares",
  description: "To improve our employee retention, negotiate with board members to give a shares package to employees, giving them a vested interest and discouraging them leaving.",
  xp: 5,
  company: company
)
