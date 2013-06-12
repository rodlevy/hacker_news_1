class User < ActiveRecord::Base

  has_many :posts
  has_many :comments

  has_many :post_votes
  has_many :all_posts_by_voter, :through => :post_votes, :source => :voter
  has_many :comment_votes


  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    p @user = User.new(params)
    p @user.password = params[:password]
    @user.save!
    @user
  end

end
