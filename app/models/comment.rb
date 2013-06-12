class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, :class_name => "User", :foreign_key => :user_id

  has_many :comment_votes
  has_many :voters, :through => :comment_votes
end
