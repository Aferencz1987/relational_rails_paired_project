require 'rails_helper'

RSpec.describe 'Guitars index page' do

  before(:all) do
    @manufacturer = Manufacturer.create!(brand: "Simon's Importers", days_since_last_incident: 0, domestic: true)
    @explorer = Guitar.create!(model: "Explorer", price: 1199.99, sold: false, manufacturer_id: @manufacturer.id)
    @strat = Guitar.create!(model: "Stratocaster", price: 1399.99, sold: true, manufacturer_id: @manufacturer.id)
    @sg = Guitar.create!(model: "SG", price: 1799.99, sold: false, manufacturer_id: @manufacturer.id)
  end

  it 'shows all guitars' do
    # Test is skipped because new functionality makes old test obsolete
    skip
    #[x] done

    #User Story 3, Child Index (x2)

    #As a visitor
    #When I visit '/child_table_name'
    #Then I see each Child in the system including the Child's attributes:
    visit '/guitars'
    expect(page).to have_content(@explorer.model)
    expect(page).to have_content("$1399.99")
  end

  it 'only shows guitars in stock' do
    # NOTE: original prompt wanted true, but false makes more sense
    #in the context of our site.
    #[ ] done

    #User Story 15, Child Index only shows `false` Records (x2)

    #As a visitor
    #When I visit the child index
    #Then I only see records where the boolean column is `false`
    visit '/guitars'
    expect(page).to have_content(@explorer.model)
    expect(page).not_to have_content(@strat.model)
  end
#[ ] done

#User Story 18, Child Update From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to edit that child's info
#When I click the link
#I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11

#[ ] done

#User Story 23, Child Delete From Childs Index Page (x1)

#As a visitor
#When I visit the `child_table_name` index page or a parent `child_table_name` index page
#Next to every child, I see a link to delete that child
#When I click the link
#I should be taken to the `child_table_name` index page where I no longer see that child


end
