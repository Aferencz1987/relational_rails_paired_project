require 'rails_helper'

RSpec.describe 'tool show page' do
  it 'shows tool name and attributes' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store1.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store1.id)

    visit "/tools/#{tool1.id}"

    expect(page).to have_content(tool1.name)
    expect(page).to have_content(tool1.price)
    expect(page).to have_content("Sorry but this item is not on sale. Full price for you!")

    visit "/tools/#{tool2.id}"

    expect(page).to have_content(tool2.name)
    expect(page).to have_content(tool2.price)
    expect(page).to have_content("This item is on sale!")
  end
end


#[ ] done

#User Story 14, Child Update (x2)

#As a visitor
#When I visit a Child Show page
#Then I see a link to update that Child "Update Child"
#When I click the link
#I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
#When I click the button to submit the form "Update Child"
#Then a `PATCH` request is sent to '/child_table_name/:id',
#the child's data is updated,
#and I am redirected to the Child Show page where I see the Child's updated information

#[ ] done

#User Story 20, Child Delete (x2)

#As a visitor
#When I visit a child show page
#Then I see a link to delete the child "Delete Child"
#When I click the link
#Then a 'DELETE' request is sent to '/child_table_name/:id',
#the child is deleted,
#and I am redirected to the child index page where I no longer see this child


#[x] done

#User Story 4, Child Show (x2)

#As a visitor
#When I visit '/child_table_name/:id'
#Then I see the child with that id including the child's attributes:
