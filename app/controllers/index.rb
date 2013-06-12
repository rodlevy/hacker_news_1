get '/' do
  @posts = Post.all
  erb :index
end

get '/comments/:post_id' do 
  @post = Post.find_by_id(params[:post_id])
  @comments = @post.comments
  erb :comments
end

get '/user_profile/:user_id' do
  @user = User.find_by_id(params[:user_id])
  @posts = @user.posts
  @comments = @user.comments
  erb :user_profile
end


