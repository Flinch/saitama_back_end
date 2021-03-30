class RemoveUserIdFromAnimes < ActiveRecord::Migration[6.0]
  def change
    remove_column :animes, :user_id, :integer
  end
end
