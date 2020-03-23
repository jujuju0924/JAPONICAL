class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
    respond_to do |format|
      format.html { redirect_to "/posts/#{comment.post.id}", notice: "メッセージを送信しました" }
      format.json
    end
  else
    @coment = @user.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end