require 'rails_helper'

RSpec.describe Tool do
  it{should belong_to :store}

  it 'shorts alphabetically' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)
    tool3 = Tool.create!(name: "Table Saw for magicians", price: 159.00, on_sale: false, store_id: store.id)
    sorted_tools = Tool.sort_alphabetically
    expect(sorted_tools.first.name).to eq("Handy Dandy Screwdriver")
  end


end

#User Story 15, Child Index only shows `false` Records (x2)

#As a visitor
#When I visit the child index
#Then I only see records where the boolean column is `false`
