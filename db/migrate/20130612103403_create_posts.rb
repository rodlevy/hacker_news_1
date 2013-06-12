class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :title
      p.string :url
      p.references :user
      p.timestamps
    end
  end
end
