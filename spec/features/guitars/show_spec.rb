require 'rails_helper'

RSpec.describe 'Guitar information' do

  before(:all) do
    Guitar.destroy_all
    manufacturer = Manufacturer.create!(brand: "Simon's Importers", days_since_last_incident: 0, domestic: true)
    @sg = manufacturer.guitars.create!(model: "SG", price: 1799.99, sold: true)
    @id = @sg.id.to_s
  end

  it 'shows detailed information guitar' do
    #[x] done

    #User Story 4, Child Show (x2)

    #As a visitor
    #When I visit '/child_table_name/:id'
    #Then I see the child with that id including the child's attributes:
    visit '/guitars/' + @id
    expect(page).to have_content("Out of stock")
    expect(page).to have_content("$1799.99")
    expect(page).to have_content("SG")
  end

  it 'can update a guitar on the show page' do
    #[x] done

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
    visit "/guitars/#{@id}"
    click_link "Update Guitar"
    expect(current_path).to eq "/guitars/#{@sg.id}/edit"
    fill_in "model", with: "1963 SG"
    choose "sold_false"
    fill_in "price", with: "3099.99"
    click_button "Update Guitar"
    expect(current_path).to eq '/guitars'
    expect(page).to have_content "1963 SG"
    expect(page).not_to have_content "An Old SG"
  end

  it 'can delete a guitar record' do
    #[x] done

    #User Story 20, Child Delete (x2)

    #As a visitor
    #When I visit a child show page
    #Then I see a link to delete the child "Delete Child"
    #When I click the link
    #Then a 'DELETE' request is sent to '/child_table_name/:id',
    #the child is deleted,
    #and I am redirected to the child index page where I no longer see this child
    visit "/guitars/#{@sg.id}"
    click_link "Delete"
    expect(current_path).to eq "/guitars"
    expect(page).not_to have_content @sg.model
  end
end
