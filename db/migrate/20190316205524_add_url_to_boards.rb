class AddUrlToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :url, :string
  end
end
