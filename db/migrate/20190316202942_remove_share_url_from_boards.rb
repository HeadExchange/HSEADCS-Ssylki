class RemoveShareUrlFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :share_url, :string
  end
end
