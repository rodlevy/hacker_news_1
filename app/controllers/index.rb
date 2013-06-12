get '/' do
  @posts = Post.all
  erb :index
end

get '/comments/:post_id' do 
  @post = Post.find_by_id(params[:post_id])
  @comments = @post.comments
  user_id= current_user.id
  comment = Comment.find_by_user_id(user_id)
  p comment
  # @points = comment.comment_votes.sum('vote')
  erb :comments
end

get '/user_profile/:user_id' do
  @user = User.find_by_id(params[:user_id])
  @posts = @user.posts
  @comments = @user.comments
  erb :user_profile
end

post '/comment/vote' do
  p user_id= current_user.id
  post_id = params[:post_id]
  comment_id = params[:comment_id]
  vote = params[:vote].to_i
  comment = Comment.find(comment_id)
  votes = comment.comment_votes
  CommentVote.create(:comment_id => comment_id,
                     :user_id   => user_id,
                     :vote => vote)
  user_vote = votes.find_by_user_id(user_id)
  @points = comment.comment_votes.sum('vote')
  redirect to "/comments/#{post_id}"
end

post '/post/vote' do
  user_id = current_user.id
  post_id = params[:post_id]
  post = Post.find(post_id)
  vote = params[:vote].to_i
  votes = post.post_votes
  PostVote.create(:post_id => post_id,
                     :user_id   => user_id,
                     :vote => vote)
  redirect to "/"
end
