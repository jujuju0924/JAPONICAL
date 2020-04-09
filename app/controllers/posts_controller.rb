class PostsController < ApplicationController
  before_action :set_post, only: %i[edit show]
  before_action :move_to_index, except: %i[index show search]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    @tags = Post.all.includes(:tags)
    @post = Post.all
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

  def edit; end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path
  end

  def show
    @lat = @post.latitude
    @lng = @post.longitude
    gon.lat = @lat
    gon.lng = @lng
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:name, :text, :address, :image, :latitude, :longitude, :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
