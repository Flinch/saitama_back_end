class UsersAnime < ApplicationRecord
	belongs_to :users
	belongs_to :anime
end
