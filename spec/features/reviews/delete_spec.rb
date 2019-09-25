require 'rails_helper'

RSpec.describe 'Delete Review' do
  describe 'in the Item Show page' do
    it 'I can delete a review' do
      item = create(:item)
      review = create(:review, item_id: item.id)
      review2 = create(:review, item_id: item.id, title: 'second review')

      visit "/items/#{item.id}"

      click_on('Delete Review', match: :first)

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content(review2.title)
      expect(page).to_not have_content(review.title)
    end
  end
end
