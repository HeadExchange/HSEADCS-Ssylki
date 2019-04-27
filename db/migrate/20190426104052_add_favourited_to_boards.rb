class AddFavouritedToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :favourited, :boolean, default: false
  end
end
