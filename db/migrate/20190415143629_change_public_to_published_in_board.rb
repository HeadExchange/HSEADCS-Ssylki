class ChangePublicToPublishedInBoard < ActiveRecord::Migration[5.2]
  def change
    rename_column :boards, :public, :published
  end
end
