class AddUsersToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :user_id, :integer
  end
end
