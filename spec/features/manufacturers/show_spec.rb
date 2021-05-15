require 'rails_helper'

RSpec.describe 'Manufacturer info' do

  before(:all) do
    @fender = Manufacturer.create(brand: "Fender", domestic: false, days_since_last_incident: 222)
    @fender.guitars.create(model: "Stratocaster", price: 1122.99, sold: false)
    @fender.guitars.create(model: "Telecaster", price: 1499.99, sold: true)
    @id = @fender.id.to_s
  end

  it 'shows manufacturer info' do
    #[x] done

    #User Story 2, Parent Show (x2)

    #As a visitor
    #When I visit '/parents/:id'
    #Then I see the parent with that id including the parent's attributes:
    #- data from each column that is on the parent table
    visit '/manufacturers/' + @id

    expect(page).to have_content("is based overseas.")
    expect(page).to have_content("safety incident in 222 days.")
  end

  it 'contains count of its guitars' do
    #[ ] done

    #User Story 7, Parent Child Count (x2)

    #As a visitor
    #When I visit a parent's show page
    #I see a count of the number of children associated with this parent
    visit '/manufacturers/' + @id

    expect(page).to have_content("#{@fender.brand} has 2 guitars.")
  end

#[ ] done

#User Story 7, Parent Child Count (x2)

#As a visitor
#When I visit a parent's show page
#I see a count of the number of children associated with this parent

#[ ] done

#User Story 10, Parent Child Index Link

#As a visitor
#When I visit a parent show page ('/parents/:id')
#Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')


#[ ] done
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
end
