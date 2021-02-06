# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
