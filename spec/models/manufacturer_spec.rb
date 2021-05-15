require 'rails_helper'

RSpec.describe Manufacturer do
  it {should have_many :guitars}

  before(:all) do
    Manufacturer.destroy_all
  end

  it 'sorts by most recent' do
    @fender = Manufacturer.create(brand: "Fender", domestic: false, days_since_last_incident: 240, created_at: DateTime.now)
    @gibson = Manufacturer.create(brand: "Gibson", domestic: true, days_since_last_incident: 455, created_at: DateTime.yesterday)
    expect(Manufacturer.most_recent.first).to eq(@fender) 
  end
end
