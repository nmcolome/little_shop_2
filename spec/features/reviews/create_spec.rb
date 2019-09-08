require 'rails_helper'

RSpec.describe 'Review creation' do
  describe "When I visit an item's show page" do
    it 'there is a link to create a review' do
      item = create(:item)
      attrs = attributes_for(:review)

      visit "/items/#{item.id}"

      click_link 'Add review'

      expect(current_path).to eq("/items/#{item.id}/reviews/new")

      fill_in 'review[title]', with: attrs[:title]
      fill_in 'review[content]', with: attrs[:content]
      fill_in 'review[rating]', with: attrs[:rating]
      click_on 'Add review'

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content(attrs[:title])
      expect(page).to have_content(attrs[:content])
      expect(page).to have_content(attrs[:rating])
    end
  end
end
