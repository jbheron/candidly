class CreateResponses < ActiveRecord::Migration
  def change
  	create_table :responses do |t|
  		t.string	:response 
  		t.boolean	:q_approves_connection
  		t.boolean :a_approves_connection
  		t.boolean :voted_best

  		t.timestamps
  	end
  end
end
