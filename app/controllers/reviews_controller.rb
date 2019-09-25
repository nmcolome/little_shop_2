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

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    Review.find(params[:review_id]).update(review_params)

    redirect_to "/items/#{params[:id]}"
  end

  def destroy
    Review.destroy(params[:review_id])

    redirect_to "/items/#{params[:id]}"
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end