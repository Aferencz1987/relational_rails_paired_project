class Manufacturer < ApplicationRecord
  has_many :guitars

  def self.most_recent
    self.order(created_at: :desc)
  end

end
