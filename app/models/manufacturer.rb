class Manufacturer < ApplicationRecord
  has_many :guitars, dependent: :destroy

  def self.most_recent
    self.order(created_at: :desc)
  end

  def over_price(limit)
    self.guitars.where("price > #{limit}")
  end

end
