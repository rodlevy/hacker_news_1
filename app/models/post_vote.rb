class PostVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :voter, class_name: "User", :foreign_key => :user_id

end
