class CreateMal < ActiveRecord::Migration[6.0]
  def change
    create_table :mals do |t|
    	t.integer :user_id
    	t.integer :anime_id
    end
  end
end
