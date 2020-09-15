class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = PostTag.new
  end

  def create
    @post = PostTag.new(post_params)
    if @post.valid?
      @post.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"])
    render json:{ keyword: tag }
  end
  

  private

  def post_params
    params.require(:post_tag).permit(:message, :name)
  end
end
