class RemoveSlugFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :slug, :string
  end
end
