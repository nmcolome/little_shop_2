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

# As a visitor,
# When I visit an item's show page
# I see a link to add a new review for this item.
# When I click on this link, I am taken to a new review path
# On this new page, I see a form where I must enter:

# a review title
# a numeric rating that can only be a number from 1 to 5
# some text for the review itself
# When the form is submitted, I should return to that item's
# show page and I should see my review text.
