# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Rake::Task['db:drop'].invoke
# Rake::Task['db:create'].invoke
# Rake::Task['db:migrate'].invoke

boards = [
  ['Рецепты', 'comfort food по вегану и чтобы удивить родителей'],
  ['Музеи', 'статейки про музеи ))'],
  ['Книги', 'я умею читать азбука.pdf download here'],
  ['Математика', 'Список от Львовского + онлайн-калькуляторы. Ссылки по линалу на избранные главы, чтобы подготовиться к семинарам'],
  ['Спорт', 'йога и пилатес на youtube, тренировки для расслабления и снятия стресса']
]

boards.each do |board|
  Board.create(title: board[0], description: board[1])
end


# link = [
# ]

# links.each do |link|
#   Link.create(url: link[0], board_id: Boards.sample.id)
# end
