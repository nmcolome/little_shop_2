require 'rails_helper'

RSpec.describe 'Reviews list in item show page' do
  item = create!(:item)
  review = create!(:review, item_id: item.id)
  review2 = create!(:review, item_id: item.id, rating: 1)

  visit "/items/#{item.id}"

  expect(page).to have_content review.title
  expect(page).to have_content review.content
  expect(page).to have_content review.rating
  expect(page).to have_content review2.rating
end

# As a visitor,
# When I visit an item's show page,
# I see a list of reviews for that item
# Each review will have:

# title
# content of the review
# rating (1 to 5)