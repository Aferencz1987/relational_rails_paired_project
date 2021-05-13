class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def inventory
    @manufacturer = Manufacturer.find(params[:id])
    all_guitars = Guitar.all
    @guitars_sorted_by_manu_id = all_guitars.where(manufacturer_id:@manufacturer.id)
    # @guitars.find_all where (guitar.manufacturer_id == manufacturer)
    # find manufacturer, look at their guitars, return array of guitars
  end
end
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that
# Parent with each Child's attributes:
