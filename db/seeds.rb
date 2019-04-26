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
  create_links
end

def create_admin
  password = 'testtest'

  admin = User.create(
    email: "admin@admin.admin",
    nickname: 'admin',
    admin: true,
    password: password,
    password_confirmation: password
  )

  puts "Admin with email #{ admin.email } was created"
end

def create_users
  10.times do |i|
    nickname = "user" + i.to_s
    email = nickname + "@" + nickname + "." + nickname
    create_user(email, nickname)
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

def random_board_id
  User.all.sample.id
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

  # boards = [
  #   [ "Артефакты", "Объекты материального мира" ],
  #   [ "Дизайн", "Шрифты, люди, сетки и стеки" ],
  #   [ "Учёба", "React stuff etc." ],
  #   [ "Статьи", "Список для чтения" ],
  #   [ "Философия", "Мысли великих людей" ],
  #   [ "Вечеринка", ":)" ],
  #   [ "Мусор", "Всякое" ],
  # ]
  #
  # boards.each do |name, description|
  #   Board.create( name: name, description: description )
  # end

end

def create_links
    links = [
      'https://www.apple.com/iphone-xr',
      'https://busedu.hse.ru',
      'https://events.yandex.ru/events/ds/16-feb-2019',
      'https://research.yandex.com/publications/154',
      'https://reactjs.org/docs/react-dom.html',
      'http://www.eliequintard.com/prod/HAINS_DEX_2',
      'https://ony.ru',
      'https://moscowmusicschool.ru',
      'https://minimalissimo.com/less-but-better'
      'https://ru.wikipedia.org/wiki/Утопление',
      'https://ru.wikipedia.org/wiki/Повешение',
      'https://ru.wikipedia.org/wiki/Яд',
      'http://www.generative-gestaltung.de/2',
      'https://vk.com/@physics_math-detalnyi-plan-samoobrazovaniya-v-computer-science-za-15-goda',
      'https://www.youtube.com/watch?v=-bMRxQbLUlg',
      'https://www.e-flux.com',
      'https://www.smallvictori.es',
      'https://seance.ru/blog/esse/bruce_weber/?utm_source=vk&utm_medium=social&utm_campaign=targetings&utm_content=instant#0_8___1680_204236137',
      'https://thngs.co/things/10657',
      'https://thngs.co/things/10687',
      'https://thngs.co/things/9753',
      'https://thngs.co/things/10333',
      'https://thngs.co/things/10249',
      'https://thngs.co/things/9475',
      'https://thngs.co/things/10678',
      'https://www.itsnicethat.com/features/ones-to-watch-2019-introducing-250219',
      'https://56.digital/'
    ]

    links.each do |link|
      create_link(link)
    end

    puts "Links were created"
end

def create_link(link)
  board = Board.all.sample
  user = User.find(board.user_id)

  l = Link.create(url: link, board_id: board.id, user_id: user.id)

  puts "Link #{l.title} created"
end

seed_data
