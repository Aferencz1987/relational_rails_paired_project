class GuitarsController < ApplicationController

  def index
    @guitars = Guitar.available
  end

  def show
    @guitar = Guitar.find(params[:id])
  end
end
