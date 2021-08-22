# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  prepend_before_action :set_commentable, only: %i[create new destroy edit update]

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
