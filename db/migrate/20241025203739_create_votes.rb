class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.string :candidate_address
      t.string :voter_address
      t.datetime :timestamp

      t.timestamps
    end
    add_index :votes, :voter_address
    add_index :votes, :candidate_address
  end
end