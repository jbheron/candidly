class Response < ActiveRecord::Base
	belongs_to :question
	has_many :users_responses
	has_many :users, through: :users_responses
end