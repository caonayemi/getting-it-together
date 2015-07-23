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

Pillar.create!(name: "Physical Togetherness", description: "I strive to take care of my body", priority: 1)
Pillar.create!(name: , description: "I strive to take care of my emotions", priority: 2)
Pillar.create!(name: , description: "I strive to take care of my space", priority: 3)
Pillar.create!(name: , description: "I strive to take care of my relationships", priority: 4)
Pillar.create!(name: , description: "I strive to prioritize intentionally", priority: 5)
Pillar.create!(name: , description: "I strive to take care of my finances", priority: 6)
Pillar.create!(name: , description: "I strive to be flexible", priority: 7)