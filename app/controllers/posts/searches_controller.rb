class Posts::SearchesController < ApplicationController
  def index
    @posts = Post.where('name LIKE ?', "%#{params[:search]}%")
  end
end
