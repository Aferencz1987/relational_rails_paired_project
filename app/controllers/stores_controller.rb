class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
    store = Store.new({
      name: params[:store][:name],
      distance: params[:store][:distance], # add .to_i back in if things break
      open: params[:store][:open]
      })

    store.save

    redirect_to '/stores'
  end

  def update

  end

  def show
    @store = Store.find(params[:id])
  end

  def inventory
    @store = Store.find(params[:id])
    @tools = @store.tools
  end
end
