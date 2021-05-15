require 'rails_helper'

RSpec.describe Guitar, type: :model do
  before(:all) do
    Guitar.destroy_all
  end
  
  it {should belong_to :manufacturer}

  it 'returns guitars in stock' do
    @manufacturer = Manufacturer.create!(brand: "Simon's Importers", days_since_last_incident: 0, domestic: true)
    @explorer = Guitar.create!(model: "Explorer", price: 1199.99, sold: false, manufacturer_id: @manufacturer.id)
    @strat = Guitar.create!(model: "Stratocaster", price: 1399.99, sold: true, manufacturer_id: @manufacturer.id)
    @sg = Guitar.create!(model: "SG", price: 1799.99, sold: false, manufacturer_id: @manufacturer.id)
    in_stock = Guitar.available
    expect(in_stock.count).to eq 2
    expect(in_stock).not_to include(@strat)
  end
end
