# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

@users = [
  'admin@admin.admin', 'artisinternal@yandex.ru', 'katyanikitina@yandex.ru'
]

@boards = [
  [ "Артефакты", "Объекты материального мира" ],
  [ "Дизайн", "Шрифты, люди, сетки и стеки" ],
  [ "Учёба", "React stuff etc." ],
  [ "Статьи", "Список для чтения" ],
  [ "Философия", "Мысли великих людей" ],
  [ "Вечеринка", ":)" ],
  [ "Мусор", "Всякое" ],
]

@links = [
  'https://www.apple.com/iphone-xr',
  'https://busedu.hse.ru',
  'https://events.yandex.ru/events/ds/16-feb-2019',
  'https://research.yandex.com/publications/154',
  'https://reactjs.org/docs/react-dom.html',
  'http://www.eliequintard.com/prod/HAINS_DEX_2',
  'https://ony.ru',
  'https://moscowmusicschool.ru',
  'https://minimalissimo.com/less-but-better'
  'https://pl.wikipedia.org/wiki/Logika',
  'https://www.readingdesign.org/index-1',
  'https://www.stockholmdesignlab.se',
  'http://www.generative-gestaltung.de/2',
  'https://canary---yellow.com',
  'https://opensourcerover.jpl.nasa.gov/#!/home',
  'https://www.e-flux.com',
  'https://www.smallvictori.es',
]

def seed_data
  create_users

  10.times do
    create_boards
  end

  10.times do
    create_links
  end

  10.times do
    create_shared_board
  end
end

def create_users
  @users.each do |user|
  random = Faker::Verb.base
  admin = user == 'admin@admin.admin' ? true : false
  u = create_user(user, random, admin)
end

10.times do |i|
    random = Faker::Verb.base
    nickname = "user" + random + i.to_s
    email = nickname + "@" + nickname + "." + nickname
    create_user(email, nickname, false)
  end
end

def create_user(email, nickname, admin)
  password = 'testtest'

  u = User.create!(
  email: email,
  nickname: nickname,
  admin: admin,
  password: password,
  password_confirmation: password
)

  puts "User with email #{ u.email } was created"
  puts "And he is an admin" if admin
end

def create_boards
  @boards.each do |board|
    user = User.all.sample
    board = user.boards.create!(title: board[0], description: board[1])

    puts "Board with title #{ board.title } just created"
  end
end

def create_links
  @links.each do |link|
    board = Board.all.sample
    user = User.find(board.user_id)
    l = user.links.create!(url: link, board_id: board.id)

    puts "Link with title #{ l.title } just created"
  end
end

def create_shared_board
  user = User.all.sample
  collaborator = User.all.sample

  if user.id != collaborator.id
    board = user.boards.sample
    collaboration = collaborator.collaborations.create!(board_id: board.id)

    puts "Collaborator with email #{collaborator.email} just added to the board with title #{board.title}"
  end
end

seed_data
