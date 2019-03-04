class AddDescriptionToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :description, :string
  end
end
