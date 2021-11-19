# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  private

  def commentable_type
    Report
  end
end
