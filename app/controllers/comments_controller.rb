# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create destroy edit update]
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def destroy
    @comment.destroy!
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render 'comments/edit'
    end
  end

  private

  def set_commentable
    commentable_name = commentable_type.name.underscore
    @commentable = commentable_type.find(params["#{commentable_name}_id"])
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
