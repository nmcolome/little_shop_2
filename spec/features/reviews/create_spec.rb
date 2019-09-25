require 'rails_helper'

RSpec.describe 'Review creation' do
  before(:each) do
    @item = create(:item)
    @attrs = attributes_for(:review)
  end

  context "When I visit an item's show page" do
    describe 'there is a link to create a review' do
      it 'I completely fill out the form' do
        visit "/items/#{@item.id}"

        click_link 'Add review'

        expect(current_path).to eq("/items/#{@item.id}/reviews/new")

        fill_in 'review[title]', with: @attrs[:title]
        fill_in 'review[content]', with: @attrs[:content]
        fill_in 'review[rating]', with: @attrs[:rating]
        click_on 'Add review'

        expect(current_path).to eq("/items/#{@item.id}")
        expect(page).to have_content(@attrs[:title])
        expect(page).to have_content(@attrs[:content])
        expect(page).to have_content(@attrs[:rating])
      end

      it "I don't fill out the form completely" do
        visit "/items/#{@item.id}"

        click_link 'Add review'

        fill_in 'review[title]', with: @attrs[:title]
        fill_in 'review[rating]', with: @attrs[:rating]
        click_on 'Add review'

        expect(page).to have_content('Please fill out all required fields.')
      end
    end
  end
end
