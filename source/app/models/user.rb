require 'bcrypt'

class User < ActiveRecord::Base
	has_and_belongs_to_many :questions
	has_many :user_responses
	has_many :responses, through: :users_responses

  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

# class Demo
#   def initialize(application)
#     @application = application
#   end

#   def info
#     @application.response.to_json
#   end
# end
