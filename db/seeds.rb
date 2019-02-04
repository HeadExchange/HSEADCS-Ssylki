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
    admin: true,
    password: password,
    password_confirmation: password
  )

  puts "Admin with email #{ admin.email } was created"
end

def create_users
  20.times do |i|
    username = "user" + i.to_s
    email = username + "@" + username + "." + username
    create_user(email)
  end
end

def create_user(email)
  password = 'testtest'

  user = User.create(
    email: email,
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

  # boards = [
  #   ['Рецепты', 'Сomfort food по вегану и чтобы удивить родителей. Если нагрянули гости, real man always has something in the oven.'],
  #   ['Книги', 'Рекомендованные книги по искусству. Ещё те, которые остались непрочитанными с того самого списка из 2016. Must-read от бабушки.'],
  #   ['Статьи', 'Сборная солянка. То, что нужно прочитать до декабря, психология и философия.'],
  #   ['Математика', 'Список от Львовского + онлайн-калькуляторы. Ссылки по дискре на избранные главы, чтобы подготовиться к семинарам'],
  #   ['Спорт', 'Йога и пилатес на youtube, тренировки для расслабления и снятия стресса. Плейлисты для бега. Те самые кроссовки.']
  # ]

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
