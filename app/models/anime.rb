class Anime < ApplicationRecord
	validates :title, presence: true, length: { minimum: 2, maximum: 100 }
	validates :mal_id, presence: true, uniqueness: true
	has_many :mals
	has_many :users, through: :mals
end