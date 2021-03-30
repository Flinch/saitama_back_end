class Anime < ApplicationRecord
	validates :title, presence: true, length: { minimum: 2, maximum: 100 }
	has_many :mals
	has_many :users, through: :mals
end