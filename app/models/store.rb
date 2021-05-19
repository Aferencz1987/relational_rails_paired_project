class Store < ApplicationRecord
  has_many :tools, dependent: :destroy

  def self.created_at_order
    order(created_at: :desc)
  end

  def over_price(price_cap)
    self.tools.where("price > #{price_cap}")
  end
end
