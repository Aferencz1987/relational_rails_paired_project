require 'rails_helper'

RSpec.describe 'show page' do
  it 'displays store and its attributes' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    store2 = Store.create!(name: 'Abe', distance: 260, open: false)

    visit "/stores/#{store1.id}"

    expect(page).to have_content(store1.name)
    expect(page).to have_content(store1.distance)
    expect(page).to have_content("True we are open.")

    visit "/stores/#{store2.id}"

    expect(page).to have_content("Sorry, we are closed.")
  end

  it 'displays tool count per store' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

    visit "/stores/#{store.id}/tools"

    expect(page).to have_content(store.tools.count)
  end

  it 'store has a list to its tools' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

    visit "/stores/#{store.id}"

    expect(page).to have_link("#{store.tools.count} tools")
    click_link("#{store.tools.count} tools")
    expect(current_path).to eq("/stores/#{store.id}/tools")
  end

  it 'can update a store'
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

    visit "/stores/#{store.id}"

    expect(page).to have_link()
end

# ???????????? updated in index spec?
#User Story 12, Parent Update (x2)

#As a visitor
#When I visit a parent show page
#Then I see a link to update the parent "Update Parent"
#When I click the link "Update Parent"
#Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
#When I fill out the form with updated information
#And I click the button to submit the form
#Then a `PATCH` request is sent to '/parents/:id',
#the parent's info is updated,
#and I am redirected to the Parent's Show page where I see the parent's updated info

#[ ] done

#User Story 19, Parent Delete (x2)

#As a visitor
#When I visit a parent show page
#Then I see a link to delete the parent
#When I click the link "Delete Parent"
#Then a 'DELETE' request is sent to '/parents/:id',
#the parent is deleted, and all child records are deleted
#and I am redirected to the parent index page where I no longer see this parent
