require 'rails_helper'

RSpec.describe 'Stores index page' do
  it 'displays store name' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)

    visit '/stores'

    expect(page).to have_content(store.name)
  end

  it 'displays by most recently created' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: 'Hammer', price: 25, on_sale: false)
    tool2 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false)
    tool3 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true)

    visit '/stores'

    expect(page).to have_content(tool1.created_at)
    expect(page).to have_content(tool2.created_at)
    expect(page).to have_content(tool3.created_at)
  end

end

#[ ] done

#User Story 11, Parent Creation (x2)

#As a visitor
#When I visit the Parent Index page
#Then I see a link to create a new Parent record, "New Parent"
#When I click this link
#Then I am taken to '/parents/new' where I  see a form for a new parent record
#When I fill out the form with a new parent's attributes:
#And I click the button "Create Parent" to submit the form
#Then a `POST` request is sent to the '/parents' route,
#a new parent record is created,
#and I am redirected to the Parent Index page where I see the new Parent displayed.

#[ ] done

#User Story 17, Parent Update From Parent Index Page (x2)

#As a visitor
#When I visit the parent index page
#Next to every parent, I see a link to edit that parent's info
#When I click the link
#I should be taken to that parents edit page where I can update its information just like in User Story 4

#[ ] done

#User Story 22, Parent Delete From Parent Index Page (x1)

#As a visitor
#When I visit the parent index page
#Next to every parent, I see a link to delete that parent
#When I click the link
#I am returned to the Parent Index Page where I no longer see that parent


# [X] done
#
# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# [X] done
#
# User Story 6, Parent Index sorted by Most Recently Created (x2)
#
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
