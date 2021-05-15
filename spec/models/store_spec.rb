require 'rails_helper'

RSpec.describe Store do
  it{should have_many :tools}

  it 'displays by most recently created' do
    store1 = Store.create!(name: 'Ace', distance: 20, open: true)
    store2 = Store.create!(name: 'Abe', distance: 260, open: false)
    store3 = Store.create!(name: 'Ale', distance: 90, open: true)


    expect(Store.created_at_order).to eq([store3, store2, store1])
  end
end
