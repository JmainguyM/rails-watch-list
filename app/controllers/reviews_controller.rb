class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = Review.new(params_review)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:comment, :rating)
  end
end
