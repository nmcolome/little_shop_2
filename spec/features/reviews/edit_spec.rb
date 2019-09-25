require 'rails_helper'

RSpec.describe 'Edit a Review' do
  context 'In the Item Show page' do
    it 'I can edit a review' do
      item = create(:item)
      review = create(:review, item_id: item.id)

      visit "/items/#{item.id}"

      click_on 'Edit Review'

      expect(current_path).to eq("/items/#{item.id}/reviews/#{review.id}/edit")
      expect(find_field('review[title]').value).to eq(review.title)
      expect(find_field('review[rating]').value).to eq(review.rating.to_s)
      expect(find_field('review[content]').value).to eq(review.content)

      fill_in 'review[title]', with: 'Different title'
      fill_in 'review[rating]', with: 1
      fill_in 'review[content]', with: 'New description'
      click_on 'Update'

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content('Different title')
      expect(page).to have_content(1)
      expect(page).to have_content('New description')
    end
  end
end
