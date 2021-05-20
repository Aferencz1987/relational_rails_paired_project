class Store < ApplicationRecord
  has_many :tools, dependent: :destroy

  def self.created_at_order
    order(created_at: :desc)
  end

  def fancy_tools(cutoff)
    self.tools.where("price > #{cutoff}")
  end
end
