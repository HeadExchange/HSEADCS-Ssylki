# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def seed_data
  create_admin
  create_users
  create_boards
end

def create_admin
  password = 'testtest'

  admin = User.create(
    email: "admin@admin.admin",
    nickname: 'admin'
    admin: true,
    password: password,
    password_confirmation: password
  )

  puts "Admin with email #{ admin.email } was created"
end

def create_users
  20.times do |i|
    nickname = "user" + i.to_s
    email = nickname + "@" + nickname + "." + nickrname
    create_user(email, username)
  end
end

def create_user(email, nickname)
  password = 'testtest'

  user = User.create(
    email: email,
    nickname: nickname,
    admin: false,
    password: password,
    password_confirmation: password
  )

  puts "User with email #{ user.email } was created"
end

def random_user_id
  User.all.reject { |user| user.admin == true }.sample.id
end

def create_boards

  10.times do
    board = Board.create(
      title: Faker::Color.color_name,
      description: Faker::GreekPhilosophers.quote,
      user_id: random_user_id
    )

    puts "Board #{ board.title} was created"
  end
end

seed_data
