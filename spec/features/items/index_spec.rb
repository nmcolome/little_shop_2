require 'rails_helper'

RSpec.describe 'Items index page' do
  before(:each) do
    @merchant = create(:merchant)
    @item1 = create(:item, merchant_id: @merchant.id)
    @item2 = create(:item, name: 'good product', status: 'inactive', merchant_id: @merchant.id)
    @item3 = create(:item, name: 'other product')
  end

  describe "When I visit '/items'" do
    it 'I see a list of items with their information' do
      visit '/items'

      expect(page).to have_content('a product')
      expect(page).to have_content('good product')
      expect(page).to have_content('other product')
      expect(page).to have_content('Very useful for doing the thing you want')
      expect(page).to have_content(99.99)
      expect(page).to have_css("img[src*='https://placehold.it/300x300.jpg']")
      expect(page).to have_content('active')
      expect(page).to have_content('inactive')
      expect(page).to have_content(100)
      expect(page).to have_content(@merchant.name)
    end
  end

  describe "When I visit '/merchants/:merchant_id/items'" do
    it "I see a list of items that belong to the Merchant and their information" do
      visit "/merchants/#{@merchant.id}/items"

      expect(page).to have_content('a product')
      expect(page).to have_content('good product')
      expect(page).to have_content(99.99)
      expect(page).to have_css("img[src*='https://placehold.it/300x300.jpg']")
      expect(page).to have_content('active')
      expect(page).to have_content('inactive')
      expect(page).to have_content(100)
      expect(page).to_not have_content('other product')
      expect(page).to_not have_content('Very useful for doing the thing you want')
      expect(page).to_not have_content(@merchant.name)
    end
  end
end
