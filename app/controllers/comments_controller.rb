class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.build(
      comment: comment_params,
      user_id: @user.id
    )
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: t('controllers.common.notice_create', name: Book.model_name.human) }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
