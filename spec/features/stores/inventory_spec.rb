require 'rails_helper'

RSpec.describe 'inventory page' do
  it 'shows tools per store' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

    visit "/stores/#{store.id}/tools"

    expect(page).to have_content(tool1.name)
    expect(page).to have_content(tool1.price)
    expect(page).to have_content("Sorry, full price for you.")
    expect(page).to have_content(tool2.name)
    expect(page).to have_content(tool2.price)
    expect(page).to have_content("Yay! On sale!")
  end

  it 'creates a tool for a store' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

    visit "/stores/#{store.id}"
    expect(page).to have_link("add tool")
    click_link ("add tool")
    expect(current_path).to eq ("/stores/#{store.id}/tools/new")
    expect(page).to have_content("Add tool to #{store.name}")

    fill_in :name, with: "test"
    fill_in :price, with: "99"
    # choose  "true"
    expect(page).to have_button("Add tool")
    click_button "Add tool"
    expect(current_path).to eq("/stores/#{store.id}/tools")
    expect(page).to have_content("99")
  end

  it 'sorts each stores tools by alphabet' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)
    tool3 = Tool.create!(name: "Table Saw for magicians", price: 159.00, on_sale: false, store_id: store.id)

    visit "/stores/#{store.id}"

    expect(page).to have_content(tool1.name)
    expect(page).to have_content(tool2.name)
    expect(page).to have_content(tool3.name)
    expect(page).to have_button('sort alphabetically')
    click_button 'sort alphabetically'

  end

  it 'updates tools from tool index'
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

    visit "/stores/#{store.id}/tools"


end
#User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)

#As a visitor
#When I visit the Parent's children Index Page
#Then I see a link to sort children in alphabetical order
#When I click on the link
#I'm taken back to the Parent's children Index Page where
# I see all of the parent's children in alphabetical order

#[ ] done

#User Story 18, Child Update From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent
# `child_table_name` index page
#Next to every child, I see a link to edit that child's info
#When I click the link
#I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11

#[ ] done

#User Story 21, Display Records Over a Given Threshold (x2)

#As a visitor
#When I visit the Parent's children Index Page
#I see a form that allows me to input a number value
#When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
#Then I am brought back to the current index page with only the records that meet that threshold shown.

#[ ] done

#User Story 23, Child Delete From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to delete that child
#When I click the link
#I should be taken to the `child_table_name` index page where I no longer see that child
