class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :comment
      t.references :user 
      t.integer :vote
      t.timestamps
    end
  end
end
