class CreateUsersResponses < ActiveRecord::Migration
  def change
  	create_table :users_responses do |t|
  		t.integer	:user_id
  		t.integer	:response_id
  	end
  end
end
