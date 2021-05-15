require 'rails_helper'

RSpec.describe 'Manufacturers guitar inventory' do

  before(:all) do
    @fender = Manufacturer.create(brand: "Fender", domestic: false, days_since_last_incident: 222)
    @fender.guitars.create(model: "Stratocaster", price: 1122.99, sold: false)
    @fender.guitars.create(model: "Telecaster", price: 1499.99, sold: true)
    @id = @fender.id.to_s
  end

  it 'shows guitars from a single manufacturer' do
    #[ ] done

    #User Story 5, Parent Children Index (x2)

    #As a visitor
    #When I visit '/parents/:parent_id/child_table_name'
    #Then I see each Child that is associated with that Parent with each Child's attributes:
    visit '/manufacturers/' + @id + '/guitars'
    expect(page).to have_content("Telecaster")
    expect(page).to have_content("$1122.99")
    expect(page).to have_content("This guitar is available!")
    expect(page).to have_content("This guitar is sold out.")
  end

#[ ] done

#User Story 13, Parent Child Creation (x2)

#As a visitor
#When I visit a Parent Childs Index page
#Then I see a link to add a new adoptable child for that parent "Create Child"
#When I click the link
#I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
#When I fill in the form with the child's attributes:
#And I click the button "Create Child"
#Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
#a new child object/row is created for that parent,
#and I am redirected to the Parent Childs Index page where I can see the new child listed

#[ ] done

#User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)

#As a visitor
#When I visit the Parent's children Index Page
#Then I see a link to sort children in alphabetical order
#When I click on the link
#I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

#[ ] done

#User Story 18, Child Update From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
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
end
