class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
    store = Store.new({
      name: params[:store][:name],
      distance: params[:store][:distance],
      open: params[:store][:open]
      })

    store.save

    redirect_to '/stores'
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.update({
      name: params[:store][:name],
      distance: params[:store][:distance],
      open: params[:store][:open]
      })

      @store.save

      redirect_to "/stores/#{@store.id}"
  end

  def show
    @store = Store.find(params[:id])
  end

  def inventory
    @store = Store.find(params[:id])
    @tools = @store.tools
  end
end
