require 'faker'

User.destroy_all if User.all.count > 0

user1 = User.create!(
  username: "user1",
  password: 1,
  email:   "u1@mail.com"
  )

user2 = User.create!(
  username: "user2",
  password: 12,
  email:   "u2@mail.com"
  )

user3 = User.create!(
  username: "user3",
  password: 123,
  email:   "u3@mail.com"
  )

user4 = User.create!(
  username: "user4",
  password: 1234,
  email:   "u4@mail.com"
  )

physical = Pillar.create!(name: "Physical Togetherness", description: "I strive to take care of my body", priority: 1)
emotional = Pillar.create!(name: "Emotional Togetherness", description: "I strive to take care of my emotions", priority: 2)
organizational = Pillar.create!(name: "Organizational Togetherness", description: "I strive to take care of my space", priority: 3)
interpersonal = Pillar.create!(name: "Interpersonal Togetherness", description: "I strive to take care of my relationships", priority: 4)
boundaries = Pillar.create!(name: "Boundary Setting", description: "I strive to prioritize intentionally", priority: 5)
financial = Pillar.create!(name: "Financial Togetherness", description: "I strive to take care of my finances", priority: 6)
flexible = Pillar.create!(name: "Flexibility", description: "I strive to be flexible", priority: 7)

one_time_task = Strand.create!(name: "One-Time Task", description: "Similar to a to-do list, these goals can be checked off in one go", tracking_style: "One milestone")
routine = Strand.create!(name: "Routine", description: "Habit building, weekly tasks, etc.", tracking_style: "User sets number of milestones")
outreach = Strand.create!(name: "Outreach", description: "Support to other users (friends)", tracking_style: "User sets number of milestones")
reflection = Strand.create!(name: "Reflection", description: "Something to keep in mind, like a mantra", tracking_style: "No milestones; self-rating only")
no_goal = Strand.create!(name: "No Goal", description: "This one is like it sounds", tracking_style: "No milestones; self-rating only")

# To Do: Make seed data for goals using the users above

users = User.all
pillars = Pillar.all
strands = Strand.all

20.times do
  Goal.create!(setter: users.sample, name: (Faker::Hacker.verb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun), pillar: pillars.sample, strand: strands.sample, set_at: DateTime.current, deadline: (DateTime.current + 30))
end

Friendship.create!(initiator: user1, acceptor: user2)
Friendship.create!(initiator: user1, acceptor: user3)
Friendship.create!(initiator: user2, acceptor: user3)
Friendship.create!(initiator: user4, acceptor: user2)