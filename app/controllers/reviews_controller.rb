class ReviewsController < ApplicationController
  def new
  end

  def create
    @item = Item.find(params[:id])
    @item.reviews.create!(review_params)

    redirect_to "/items/#{@item.id}"
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end