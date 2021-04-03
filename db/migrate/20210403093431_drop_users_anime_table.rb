class DropUsersAnimeTable < ActiveRecord::Migration[6.0]
  def change
  	def up
    	drop_table :users_anime
  	end

	def down
	   raise ActiveRecord::IrreversibleMigration
	end
 end
end
