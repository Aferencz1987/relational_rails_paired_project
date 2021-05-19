require 'rails_helper'

RSpec.describe 'Stores index page' do
  it 'displays store name' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)

    visit '/stores'

    expect(page).to have_content(store.name)
  end

  it 'diplays when it was created' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    store2 = Store.create!(name: 'Abe', distance: 260, open: false)
    store3 = Store.create!(name: 'Ale', distance: 90, open: true)

    visit '/stores'

    expect(page).to have_content(store1.created_at.strftime("%A, %B %d, %Y"))
    expect(page).to have_content(store2.created_at.strftime("%A, %B %d, %Y"))
    expect(page).to have_content(store3.created_at.strftime("%A, %B %d, %Y"))
  end

  it 'creates a new store' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    store2 = Store.create!(name: 'Abe', distance: 260, open: false)

    visit '/stores'

    expect(page).to have_link("new store")
    click_link "new store"
    expect(current_path).to eq('/stores/new')
    fill_in "store[name]", with: "Terrible store"
    fill_in "store[distance]", with: "99"
    expect(page).to have_button("create")
    click_button "create"

    expect(current_path).to eq('/stores')
    expect(page).to have_content("Store directory")
  end

  it 'updates store from store index page' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)

    visit '/stores'

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

  it 'deletes stores from the index' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    store2 = Store.create!(name: 'Abe', distance: 260, open: false)

    visit '/stores'
    expect(page).to have_link('')
    click_on("delete #{store1.name}")
    expect(current_path).to eq "/stores"
    expect(page).not_to have_content("#{store1.name}")
  end
end
