require 'rails_helper'

RSpec.describe 'Reviews list' do
  describe 'In item show page' do
    before(:each) do
      @item = create(:item)
      @review1 = create(:review, item_id: @item.id)
      @review2 = create(:review, item_id: @item.id, rating: 1)
      @review3 = create(:review, item_id: @item.id, rating: 2)
      @review4 = create(:review, item_id: @item.id, rating: 4)
      @review5 = create(:review, item_id: @item.id, rating: 5)
    end

    it 'see a list of reviews' do
      visit "/items/#{@item.id}"

      expect(page).to have_content @review1.title
      expect(page).to have_content @review1.content
      expect(page).to have_content @review1.rating
      expect(page).to have_content @review2.rating
      expect(page).to have_content @review3.rating
      expect(page).to have_content @review4.rating
      expect(page).to have_content @review5.rating
    end

    it 'see reviews statistics' do
      visit "/items/#{@item.id}"
      expect(page).to have_content 'Average Rating'
      expect(page).to have_content 3
      expect(page).to have_content 'Reviews'
      expect(page).to have_content 5
      expect(page).to have_content 'Top 3 Reviews'
      expect(page).to have_content @review5.rating
      expect(page).to have_content @review5.title
      expect(page).to have_content 'Bottom 3 Reviews'
      expect(page).to have_content @review2.rating
      expect(page).to have_content @review2.title
    end
  end
end
