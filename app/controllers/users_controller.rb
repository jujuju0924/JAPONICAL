class UsersController < ApplicationController
  def show
    @posts = current_user.posts.page(params[:page]).per(9).order("created_at DESC")
  end
end
