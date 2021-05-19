class GuitarsController < ApplicationController

  def index
    @guitars = Guitar.available
  end

  def show
    @guitar = Guitar.find(params[:id])
  end

  def edit
    @guitar = Guitar.find(params[:id])
  end

  def create
    guitar = Guitar.find(params[:id])
    guitar.update(
      model: params[:model],
      sold: params[:sold],
      price: params[:price]
    )
    redirect_to '/guitars'
  end

  def delete
    guitar = Guitar.find(params[:id])
    guitar.destroy
    if params[:supplier]
      redirect_to "/manufacturers/#{params[:supplier]}/guitars"
    else
      redirect_to '/guitars'
    end
  end
end
