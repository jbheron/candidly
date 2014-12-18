require 'faker'

20.times {Question.create({:content => Faker::Company.bs, :user_id => rand(1..1000)})}
10.times {User.create(name: Faker::Internet.user_name, password_hash: Faker::Internet.domain_word, email: Faker::Internet.free_email)}

