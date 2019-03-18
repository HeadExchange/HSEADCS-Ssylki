class AddShareUrlToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :share_url, :string
  end
end
