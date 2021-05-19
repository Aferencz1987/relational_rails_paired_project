require 'rails_helper'

RSpec.describe Tool do
  it{should belong_to :store}

  it 'shorts alphabetically' do

    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true)
    tool3 = Tool.create!(name: "Lucky Ladder", price: 119.00, on_sale: false)
    tool4 = Tool.create!(name: "Table Saw for magicians", price: 159.00, on_sale: false)
    tool5 = Tool.create!(name: "Loose screws", price: 1.00, on_sale: false)
    tool6 = Tool.create!(name: "Morning Lumber", price: 25.00, on_sale: true)


end

#As a visitor
#When I visit the Parent's children Index Page
#Then I see a link to sort children in alphabetical order
#When I click on the link
#I'm taken back to the Parent's children Index Page where
# I see all of the parent's children in alphabetical order
#[ ] done

# NOTE: original prompt wanted true, but false makes more sense
#in the context of our site.
#[x] done

#User Story 15, Child Index only shows `false` Records (x2)

#As a visitor
#When I visit the child index
#Then I only see records where the boolean column is `false`
