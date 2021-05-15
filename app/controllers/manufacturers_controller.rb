class ManufacturersController < ApplicationController
  
  def index
    @manufacturers = Manufacturer.most_recent 
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @num_of_guitars = @manufacturer.guitars.count
  end

  def inventory
    @manufacturer = Manufacturer.find(params[:id])
    @guitars = @manufacturer.guitars
  end

  def new
  end

  def create
    capitalized = params[:brand]
    Manufacturer.create!(
      brand: capitalized,
      days_since_last_incident: params[:days_since],
      domestic: params[:domestic]
    )

    redirect_to '/manufacturers'
  end

end
