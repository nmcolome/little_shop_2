class ReviewsController < ApplicationController
  def new
  end

  def create
    @item = Item.find(params[:id])
    review = @item.reviews.new(review_params)

    if review.save
      redirect_to "/items/#{@item.id}"
    else
      flash.now[:error] = 'Please fill out all required fields.'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end