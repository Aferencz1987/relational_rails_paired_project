class Store < ApplicationRecord
  has_many :tools

  def self.created_at_order
    order(created_at: :desc)
  end
end
