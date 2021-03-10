class Anime < ApplicationRecord
	validates :title, presence: true, length: { minimum: 2, maximum: 100 }
end