class AddIdentityToCollaboration < ActiveRecord::Migration[5.2]
  def change
    add_column :collaborations, :user_id, :bigint
    add_column :collaborations, :board_id, :bigint
  end
end
