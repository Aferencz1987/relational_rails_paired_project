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
    if params[:sort] && params[:price_filter]
      limit = params[:price_filter].to_i
      @guitars = @manufacturer.guitars.over_price(limit).order(:model)
    elsif params[:sort]
      @guitars = @manufacturer.guitars.order(:model)
    elsif params[:price_filter]
      limit = params[:price_filter].to_i
      @guitars = @manufacturer.over_price(limit)
    else
      @guitars = @manufacturer.guitars
    end
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

  def new_guitar
    @manufacturer = Manufacturer.select(:brand).where(id: params[:id]).first
  end

  def create_guitar
    manufacturer = Manufacturer.find(params[:id])
    capitalized = params[:model]
    manufacturer.guitars.create!(
      model: capitalized,
      sold: params[:sold],
      price: params[:price]
    )

    redirect_to "/manufacturers/#{manufacturer.id}/guitars"
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.update(
      brand: params[:brand],
      domestic: params[:domestic],
      days_since_last_incident: params[:days_since]
    )
    redirect_to "/manufacturers"
  end

  def delete
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.destroy
    redirect_to '/manufacturers'
  end
end
