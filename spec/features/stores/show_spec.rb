#THIS IS DONE

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

  it 'updates store from store show page' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)

    visit "/stores/#{store1.id}"

    expect(page).to have_link("update #{store1.name}")
    click_link "update #{store1.name}"
    expect(current_path).to eq "/stores/#{store1.id}/edit"
    fill_in "store[name]", with: "MY aWeSOmE STORE"
    fill_in "store[distance]", with: "5"
    choose "closed"
    click_button "update"
    expect(current_path).to eq "/stores/#{store1.id}"
    expect(page).to have_content("MY aWeSOmE STORE")
    expect(page).not_to have_content("Ace")

  end

  it 'deletes stores from the show' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)

    visit "/stores/#{store1.id}"

    expect(page).to have_button('')
    click_button("Delete #{store1.name}") #click button?
    expect(current_path).to eq "/stores"
    expect(page).not_to have_content("#{store1.name}")
  end
end
