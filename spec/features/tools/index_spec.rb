require 'rails_helper'

RSpec.describe 'Tools index page' do
  it 'displays names and attributes' do
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true)

    visit "/tools"

    expect(page).to have_content(tool1.name)
    expect(page).to have_content(tool1.price)
    expect(page).to have_content(tool1.on_sale)
    expect(page).to have_content(tool2.name)
    expect(page).to have_content(tool2.price)
    expect(page).to have_content(tool2.on_sale)
  end

end

#[ ] done

#User Story 3, Child Index (x2)

#As a visitor
#When I visit '/child_table_name'
#Then I see each Child in the system including the Child's attributes:

#[ ] done


#User Story 15, Child Index only shows `true` Records (x2)

#As a visitor
#When I visit the child index
#Then I only see records where the boolean column is `true`


#[ ] done

#User Story 18, Child Update From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to edit that child's info
#When I click the link
#I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11

#User Story 23, Child Delete From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to delete that child
#When I click the link
#I should be taken to the `child_table_name` index page where I no longer see that child


it 'updates tool in tool index' do
  store = Store.create!(name: 'Ace', distance: 20, open: true)
  tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
  tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)

  visit "/stores/#{store.id}/tools"
  expect(page).to have_button("update tool")
  click_button "update tool"
  expect(current_path).to eq("/tools/edit")


end

it 'can delete from it/s index' do
  store = Store.create!(name: 'Ace', distance: 20, open: true)
  tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
  tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)
  tool3 = Tool.create!(name: "Table Saw for magicians", price: 159.00, on_sale: false, store_id: store.id)


end
#[ ] done

#User Story 23, Child Delete From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to delete that child
#When I click the link
#I should be taken to the `child_table_name` index page where I no longer see that child
