class PostsController < ActionController::Base

  def index
    # instance param
    @posts = Post.all
  end

  def show
  end
          
  def new
    @post = Post.new
  end

  def create
    puts params
    #flash[:notise] = "Post was successflly created"
    Post.create(post_params)
    redirect_to posts_path, notice: "Post was successflly created"
  end	  

  private
  def post
    @post ||= Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  helper_method :post
end
