# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

boards = [
  ['Рецепты', 'Сomfort food по вегану и чтобы удивить родителей. Если нагрянули гости, real man always has something in the oven.'],
  ['Книги', 'Рекомендованные книги по искусству. Ещё те, которые остались непрочитанными с того самого списка из 2016. Must-read от бабушки.'],
  ['Статьи', 'Сборная солянка. То, что нужно прочитать до декабря, психология и философия.'],
  ['Математика', 'Список от Львовского + онлайн-калькуляторы. Ссылки по дискре на избранные главы, чтобы подготовиться к семинарам'],
  ['Спорт', 'Йога и пилатес на youtube, тренировки для расслабления и снятия стресса. Плейлисты для бега. Те самые кроссовки.']
]

boards.each do |board|
  Board.create(title: board[0], description: board[1])
end
