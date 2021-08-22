# frozen_string_literal: true

class Books::CommentsController < CommentsController
  prepend_before_action :set_commentable, only: %i[create new destroy edit update]

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
