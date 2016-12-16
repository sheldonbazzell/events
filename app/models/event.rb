class Event < ActiveRecord::Base
	belongs_to :user
	has_many :attends, dependent: :destroy
	has_many :users, through: :attends, source: :user
	has_many :comments
	validates :name, :date, :city, presence: :true
	validate :date_must_in_the_future

  def date_must_in_the_future
  	if date
	  	errors.add(:date, "Event must have a future date") if date < Date.today
	end
  end
end
