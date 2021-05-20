class Tool < ApplicationRecord
  belongs_to :store

  def self.sort_alphabetically
    order('lower(name)')
  end

  def self.discounted
    where(on_sale: :true)
  end
end
