require 'rails_helper'

RSpec.describe 'Manufacturer index page' do

  before(:all) do
    @fender = Manufacturer.create(brand: "Fender", domestic: false, days_since_last_incident: 240, created_at: DateTime.now)
    @gibson = Manufacturer.create(brand: "Gibon", domestic: true, days_since_last_incident: 455, created_at: DateTime.yesterday)
  end

  it 'displays manufacturers' do
    #[x] done

    #user story 1, parent index (x2)

    #for each parent table
    #as a visitor
    #when i visit '/parents'
    #then i see the name of each parent record in the system
    visit '/manufacturers'
    expect(page).to have_content(@fender.brand)
    expect(page).to have_content(@gibson.brand)
  end

  it 'sorts by date created and lists that date' do
    #[x] done
    #user story 6, parent index sorted by most recently created (x2)

    #as a visitor
    #when i visit the parent index,
    #i see that records are ordered by most recently created first
    #and next to each of the records i see when it was created

    # Sorted elements tested in model test
    visit '/manufacturers'
    expect(page).to have_content(@fender.created_at)
    expect(page).to have_content(@gibson.created_at)
  end

  it 'has full create functionality' do
    #[x] done

    #user story 11, parent creation (x2)

    #as a visitor
    #when i visit the parent index page
    #then i see a link to create a new parent record, "new parent"
    #when i click this link
    #then i am taken to '/parents/new' where i  see a form for a new parent record
    #when i fill out the form with a new parent's attributes:
    #and i click the button "create parent" to submit the form
    #then a `post` request is sent to the '/parents' route,
    #a new parent record is created,
    #and i am redirected to the parent index page where i see the new parent displayed.
    visit '/manufacturers'
    expect(page).to have_link("New Supplier")
    click_link("New Supplier")
    expect(current_path).to eq '/manufacturers/new'
    fill_in "brand", with: "Ibanez"
    choose "no"
    fill_in "days_since", with: "141"
    click_button "create"
    expect(page).to have_content("Ibanez")
  end
end

#[ ] done

#user story 17, parent update from parent index page (x2)

#as a visitor
#when i visit the parent index page
#next to every parent, i see a link to edit that parent's info
#when i click the link
#i should be taken to that parents edit page where i can update its information just like in user story 4

#[ ] done

#user story 22, parent delete from parent index page (x1)

#as a visitor
#When I visit the parent index page
#Next to every parent, I see a link to delete that parent
#When I click the link
#I am returned to the Parent Index Page where I no longer see that parent

