require 'rails_helper'

RSpec.describe 'page wide' do
  describe 'store tool features' do
    it 'shows links to stores and tools on every page' do
      store = Store.create!(name: 'Ace', distance: 20, open: true)
      tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
      tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

      visit "/stores"
      expect(page).to have_link("Tool list")
      expect(page).to have_link("Store list")
      click_link("Tool list")
      expect(current_path).to eq("/tools")
      click_link("Store list")
      expect(current_path).to eq("/stores")

      visit "/stores/#{store.id}/tools"
      expect(page).to have_link("Tool list")
      expect(page).to have_link("Store list")

      visit "/tools"
      expect(page).to have_link("Tool list")
      expect(page).to have_link("Store list")

      visit "/tools/#{tool1.id}"
      expect(page).to have_link("Tool list")
      expect(page).to have_link("Store list")
    end
  end

  describe 'manufacturer guitar features' do
    it 'shows link to manufacturers and guitars on every page' do

    end
  end
end

#[ ] done

#User Story 8, Child Index Link

#As a visitor
#When I visit any page on the site
#Then I see a link at the top of the page that takes me to the Child Index

#[ ] done

#User Story 9, Parent Index Link

#As a visitor
#When I visit any page on the site
#Then I see a link at the top of the page that takes me to the Parent Index
