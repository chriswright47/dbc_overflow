class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.integer :question_id

      t.timestamps
    end
  end
end
