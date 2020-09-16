class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :getuser

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
    params.require(:post_tag).permit(:message, :name).merge(user_id: @user)
  end

  def getuser
    @user = current_user.id
  end
end
