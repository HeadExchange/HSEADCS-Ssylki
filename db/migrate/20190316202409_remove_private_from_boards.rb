class RemovePrivateFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :private, :boolean
  end
end
