class AddPublicToBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :public, :boolean, default: false
  end
end
