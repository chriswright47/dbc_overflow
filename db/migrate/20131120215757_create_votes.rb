class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.integer :user_id
      t.string  :voteable_type
      t.integer :value

      t.timestamps
    end
    add_index :votes, [:user_id, :voteable_id, :voteable_type], unique: true
  end
end
