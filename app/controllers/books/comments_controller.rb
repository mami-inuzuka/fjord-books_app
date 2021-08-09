class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create new]
  private
    def set_commentable
      @commentable = Book.find(params[:book_id])
      @user = current_user
    end
end
