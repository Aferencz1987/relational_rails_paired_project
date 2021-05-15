class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.order(created_at: :desc)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def inventory
    @manufacturer = Manufacturer.find(params[:id])
    @guitars = @manufacturer.guitars
  end
end
