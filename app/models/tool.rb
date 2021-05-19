class Tool < ApplicationRecord
  belongs_to :store

  def self.sort_alphabetically
    order('lower(name)')
  end

  def self.discounted
    where(on_sale: :true)
  end
end




#As a visitor
#When I visit the Parent's children Index Page
#Then I see a link to sort children in alphabetical order
#When I click on the link
#I'm taken back to the Parent's children Index Page where
# I see all of the parent's children in alphabetical order
#[ ] done
