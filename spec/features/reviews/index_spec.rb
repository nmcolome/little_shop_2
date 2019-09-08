require 'rails_helper'

RSpec.describe 'Reviews list' do
  it 'In item show page' do
    item = create(:item)
    review = create(:review, item_id: item.id)
    review2 = create(:review, item_id: item.id, rating: 1)
  
    visit "/items/#{item.id}"
  
    expect(page).to have_content review.title
    expect(page).to have_content review.content
    expect(page).to have_content review.rating
    expect(page).to have_content review2.rating
  end
end
