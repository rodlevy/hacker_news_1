class CommentVote < ActiveRecord::Base
    belongs_to :comment
    belongs_to :voter, class_name:'User', :foreign_key => :user_id

end
