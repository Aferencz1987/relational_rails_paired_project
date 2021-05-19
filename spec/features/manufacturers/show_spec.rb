require 'rails_helper'

RSpec.describe 'Manufacturer info' do

  before(:all) do
    Guitar.destroy_all
    Manufacturer.destroy_all
    @fender = Manufacturer.create(brand: "FENDER", domestic: false, days_since_last_incident: 222)
    @strat = @fender.guitars.create(model: "Stratocaster", price: 1122.99, sold: false)
    @tele = @fender.guitars.create(model: "Telecaster", price: 1499.99, sold: true)
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
    #[x] done

    #User Story 7, Parent Child Count (x2)

    #As a visitor
    #When I visit a parent's show page
    #I see a count of the number of children associated with this parent
    visit '/manufacturers/' + @id

    expect(page).to have_content("#{@fender.brand} has 2 guitars.")
  end
  
  it 'has link to its guitars' do
    #[#] done
    #User Story 10, Parent Child Index Link

    #As a visitor
    #When I visit a parent show page ('/parents/:id')
    #Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
    visit '/manufacturers/' + @id
    expect(page).to have_link("Guitar Inventory")
    click_link("Guitar Inventory")
    expect(current_path).to eq("/manufacturers/" + @id + "/guitars")
  end

  it 'can update it\'s record in the db' do
    #[x] done
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
    visit "/manufacturers/#{@fender.id}"
    click_on "Update #{@fender.brand}"
    expect(current_path).to eq "/manufacturers/#{@fender.id}/edit"
    fill_in "brand", with: "Fender Elite"
    choose "domestic_false"
    fill_in "days_since", with: "321"
    click_button "Update Manufacturer"
    expect(current_path).to eq '/manufacturers'
    expect(page).to have_content "Fender Elite"
    expect(page).not_to have_content "FENDER"
  end

  it 'deletes a manufacturer' do
    #[x] done

    #User Story 19, Parent Delete (x2)

    #As a visitor
    #When I visit a parent show page
    #Then I see a link to delete the parent
    #When I click the link "Delete Parent"
    #Then a 'DELETE' request is sent to '/parents/:id',
    #the parent is deleted, and all child records are deleted
    #and I am redirected to the parent index page where I no longer see this parent
    visit "/manufacturers/#{@fender.id}"
    click_link "Delete Supplier"
    expect(current_path).to eq '/manufacturers'
    expect(page).not_to have_content @fender.brand
    visit "/guitars"
    expect(page).not_to have_content @strat.model
    expect(page).not_to have_content @tele.model
  end
end
