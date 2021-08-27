# frozen_string_literal: true

class Books::CommentsController < CommentsController
  private

  def commentable_type
    Book
  end
end
