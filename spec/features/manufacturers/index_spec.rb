require 'rails_helper'
#[x] done

#User Story 1, Parent Index (x2)

#For each parent table
#As a visitor
#When I visit '/parents'
#Then I see the name of each parent record in the system

#[x] done

#User Story 6, Parent Index sorted by Most Recently Created (x2)

#As a visitor
#When I visit the parent index,
#I see that records are ordered by most recently created first
#And next to each of the records I see when it was created

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

RSpec.describe 'Manufacturer index page' do

  before(:all) do
    @fender = Manufacturer.create(brand: "Fender", domestic: false, days_since_last_incident: 240, created_at: DateTime.now)
    @gibson = Manufacturer.create(brand: "Gibon", domestic: true, days_since_last_incident: 455, created_at: DateTime.yesterday)
  end

  it 'displays manufacturers' do
    visit '/manufacturers'
    expect(page).to have_content(@fender.brand)
    expect(page).to have_content(@gibson.brand)
  end

  it 'sorts by date created and lists that date' do
    # Sorted elements tested in model test
    visit '/manufacturers'
    expect(page).to have_content(@fender.created_at)
    expect(page).to have_content(@gibson.created_at)
  end

  it 'has full create functionality' do
    visit '/manufacturers'
    expect(page).to have_link("Add a Manufacturer")
    click_link("Add a Manufacturer")
    # Test WIP
  end
end
