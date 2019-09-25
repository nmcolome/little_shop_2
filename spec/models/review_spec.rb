require 'rails_helper'

RSpec.describe Review do
  describe 'attributes' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :content }
    it { is_expected.to respond_to :rating }
  end

  describe 'relationships' do
    it { should belong_to :item}
  end

  describe 'validations' do
    it { validate_presence_of :title }
    it { validate_presence_of :content }
    it { validate_presence_of :rating }
    it { validate_numericality_of :rating }
    it { should allow_values(1, 2, 3, 4, 5).for(:rating) }
    it { should_not allow_values(-1, 0, 6, 10).for(:rating) }
  end

  describe 'class methods' do

    before(:each) do
      @item = create(:item)
      @review1 = create(:review, item_id: @item.id)
      @review2 = create(:review, item_id: @item.id, rating: 1)
      @review3 = create(:review, item_id: @item.id, rating: 2)
      @review4 = create(:review, item_id: @item.id, rating: 4)
      @review5 = create(:review, item_id: @item.id, rating: 5)
    end

    it '#top_reviews' do
      expect(@item.reviews.top_reviews).to eq([@review5, @review4, @review1])
    end

    it '#bottom_reviews' do
      expect(@item.reviews.bottom_reviews).to eq([@review2, @review3, @review1])
    end

    it '#average_rating' do
      expect(@item.reviews.average_rating).to eq(3)
    end
  end
end
