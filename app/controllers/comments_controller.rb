class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: "コメントが保存されました。"
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: "コメントが削除されました。"
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @commentable
    else
      render 'comments/edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
