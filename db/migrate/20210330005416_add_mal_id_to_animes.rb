class AddMalIdToAnimes < ActiveRecord::Migration[6.0]
  def change
  	add_column :animes, :mal_id, :int
  end
end
