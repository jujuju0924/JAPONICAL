class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show,:search]

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    if Post.create
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  def show
    @lat = @post.latitude
    @lng = @post.longitude
  end
  

  private
  def post_params
    params.require(:post).permit(:name,:text,:address,:image,:latitude,:longitude).merge(user_id: current_user.id)
  end
 
  def set_post
    @post = Post.find(params[:id])
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
