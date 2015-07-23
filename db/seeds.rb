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

physical = Pillar.create!(name: "Physical Togetherness", description: "I strive to take care of my body", priority: 1)
emotional = Pillar.create!(name: , description: "I strive to take care of my emotions", priority: 2)
organizational = Pillar.create!(name: , description: "I strive to take care of my space", priority: 3)
interpersonal = Pillar.create!(name: , description: "I strive to take care of my relationships", priority: 4)
boundaries = Pillar.create!(name: , description: "I strive to prioritize intentionally", priority: 5)
financial = Pillar.create!(name: , description: "I strive to take care of my finances", priority: 6)
flexible = Pillar.create!(name: , description: "I strive to be flexible", priority: 7)

one_time_task = Strand.create!(name: "One-Time Task", description: "Similar to a to-do list, these goals can be checked off in one go", tracking_style: "One milestone")
routine = Strand.create!(name: "Routine", description: "Habit building, weekly tasks, etc.", tracking_style: "User sets number of milestones")
outreach = Strand.create!(name: "Outreach", description: "Support to other users (friends)", tracking_style: "User sets number of milestones")
reflection = Strand.create!(name: "Reflection", description: "Something to keep in mind, like a mantra", tracking_style: "No milestones; self-rating only")
no_goal = Strand.create!(name: "No Goal", description: "This one is like it sounds", tracking_style: "No milestones; self-rating only")

# To Do: Make seed data for goals using the users above
