User.destroy_all if User.all.count > 0

u1 = User.create!(
  username: "user1",
  password: 1,
  email:   "u1@mail.com"
  )

u2 = User.create!(
  username: "user2",
  password: 12,
  email:   "u2@mail.com"
  )

u3 = User.create!(
  username: "user3",
  password: 123,
  email:   "u3@mail.com"
  )

u4 = User.create!(
  username: "user4",
  password: 1234,
  email:   "u4@mail.com"
  )
