require 'rails_helper'

RSpec.describe 'Manufacturers guitar inventory' do

  before(:all) do
    @fender = Manufacturer.create(brand: "Fender", domestic: false, days_since_last_incident: 222)
    @tele = @fender.guitars.create(model: "Telecaster", price: 1299.99, sold: true)
    @strat = @fender.guitars.create(model: "Stratocaster", price: 1599.99, sold: false)
    @id = @fender.id.to_s
  end

  it 'shows guitars from a single manufacturer' do
    #[x] done

    #User Story 5, Parent Children Index (x2)

    #As a visitor
    #When I visit '/parents/:parent_id/child_table_name'
    #Then I see each Child that is associated with that Parent with each Child's attributes:
    visit '/manufacturers/' + @id + '/guitars'
    expect(page).to have_content("Telecaster")
    expect(page).to have_content("$1599.99")
    expect(page).to have_content("This guitar is available!")
    expect(page).to have_content("This guitar is sold out.")
  end

  it 'can create a brand\'s own guitar' do
    #[x] done

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
    full_path = '/manufacturers/' + @id + '/guitars'
    visit full_path
    expect(page).to have_link("Add Guitar")
    click_link("Add Guitar")
    expect(current_path).to eq "#{full_path}/new"
    fill_in "model", with: "Special Strat"
    choose "no"
    fill_in "price", with: "1599.99"
    click_button "create"
    expect(page).to have_content("Special Strat")
  end

  it 'sorts guitars by alphabetical order' do
    #[x] done
    #User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)

    #As a visitor
    #When I visit the Parent's children Index Page
    #Then I see a link to sort children in alphabetical order
    #When I click on the link
    #I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    visit "/manufacturers/#{@id}/guitars"
    click_link "Sort Alphabetically"
    expect(@strat.model).to appear_before(@tele.model)
  end

  it 'is able to update it\'s own guitars' do
    #[x] done

    #User Story 18, Child Update From Childs Index Page (x1)

    #As a visitor
    #When I visit the `child_table_name` index page or a parent `child_table_name` index page
    #Next to every child, I see a link to edit that child's info
    #When I click the link
    #I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    visit "/manufacturers/#{@id}/guitars"
    click_on "edit-#{@tele.id}"
    expect(current_path).to eq "/guitars/#{@tele.id}/edit"
    fill_in "model", with: "Sassy Tele"
    choose "sold_true"
    fill_in "price", with: "1399.99"
    click_button "Update Guitar"
    expect(current_path).to eq '/guitars'
    # A more user-friendly redirect is preferable
    visit "/manufacturers/#{@id}/guitars"
    expect(page).to have_content "Sassy Tele"
    expect(page).not_to have_content "Telecaster"
  end

  it 'only returns guitars above a given price' do
    #[x] done

    #User Story 21, Display Records Over a Given Threshold (x2)

    #As a visitor
    #When I visit the Parent's children Index Page
    #I see a form that allows me to input a number value
    #When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    #Then I am brought back to the current index page with only the records that meet that threshold shown.
    visit "/manufacturers/#{@id}/guitars"
    fill_in "price_filter", with: "1500"
    click_button "Only return records more expensive"
    expect(current_path).to eq "/manufacturers/#{@id}/guitars"
    expect(page).to have_content "Stratocaster"
    expect(page).not_to have_content "Telecaster"
  end
#[ ] done

#User Story 23, Child Delete From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to delete that child
#When I click the link
#I should be taken to the `child_table_name` index page where I no longer see that child
end
