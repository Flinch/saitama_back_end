class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :rating

      t.timestamps
    end
  end
end
