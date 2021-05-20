require 'rails_helper'

RSpec.describe Store do
  it{should have_many :tools}

  it 'displays by most recently created' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    store2 = Store.create!(name: 'Abe', distance: 260, open: false)
    store3 = Store.create!(name: 'Ale', distance: 90, open: true)

    expect(Store.created_at_order).to eq([store3, store2, store1])
  end

  it 'shows tools over a certain price' do
    store = Store.create!(name: 'Ace', distance: 20, open: true)
    tool1 = Tool.create!(name: "Steel Hammer", price: 25.00, on_sale: false, store_id: store.id)
    tool2 = Tool.create!(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true, store_id: store.id)
    tool3 = Tool.create!(name: "Table Saw for magicians", price: 159.00, on_sale: false, store_id: store.id)


    expensive_tools = store.fancy_tools(150)
    expect(expensive_tools).to include(tool3)
    expect(expensive_tools).not_to include(tool1)
  end
end
