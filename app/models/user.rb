class User < ApplicationRecord    
	has_many :posts, dependent: :destroy
	validates :full_name, :username, :email, :password, presence: true
end
