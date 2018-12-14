class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
     change_column :links, :image, :string
  end
end
