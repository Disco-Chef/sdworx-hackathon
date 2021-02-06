the_newsroom = Company.create!(name: "The Newsroom")

user_charlie = User.create!(
  email: "charlie@newsroom.com",
  password: "123123",
  company: the_newsroom
)

user_will = User.create!(
  email: "will@newsroom.com",
  password: "123123",
  company: the_newsroom
)

user_mac = User.create!(
  email: "mac@newsroom.com",
  password: "123123",
  company: the_newsroom
)

user_sloan = User.create!(
  email: "sloan@newsroom.com",
  password: "123123",
  company: the_newsroom
)

user_jim = User.create!(
  email: "jim@newsroom.com",
  password: "123123",
  company: the_newsroom
)

user_don = User.create!(
  email: "don@newsroom.com",
  password: "123123",
  company: the_newsroom
)

user_neal = User.create!(
  email: "neal@newsroom.com",
  password: "123123",
  company: the_newsroom
)
