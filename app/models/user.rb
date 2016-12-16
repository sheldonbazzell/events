class User < ActiveRecord::Base
	email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	has_many :events
	has_many :attends
	has_many :events_attending, through: :attends, source: :user
	has_many :comments
	validates :first_name, :last_name, :email, :city, presence: :true
	has_secure_password
	validates :password, presence: :true, on: :update
	validates :email, uniqueness: { case_sensitive: false }, format: { with: email_regex }

end
