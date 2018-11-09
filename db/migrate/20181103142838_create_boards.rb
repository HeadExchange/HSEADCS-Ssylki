class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :private
      t.string :share_url

      t.timestamps
    end
  end
end
