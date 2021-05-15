class Guitar < ApplicationRecord
  belongs_to :manufacturer

  def self.available
    self.where(sold: :false)
  end
end
