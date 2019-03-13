class AddPositionToLink < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :position, :integer
  end
end
