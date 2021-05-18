class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
    store = Store.create!({
      name: params[:store][:name],
      distance: params[:store][:distance],
      open: params[:store][:open]
      })


    redirect_to '/stores'
  end

  def new_tool
    @store = Store.find(params[:id])
  end

  def create_tool
    # require "pry"; binding.pry
    store = Store.find(params[:id])
    store.tools.create!(name: params[:name], price: params[:price], on_sale: params[:on_sale])

    redirect_to "/stores/#{store.id}/tools"
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

      redirect_to "/stores"
  end

  def show
    @store = Store.find(params[:id])
  end

  def inventory
    @store = Store.find(params[:id])
    @tools = @store.tools
  end

  def destroy
    destroy_tool
    Store.destroy(params[:id])
    # Tool.destroy where: params[:store_id]
    redirect_to "/stores"
  end

  def destroy_tool
    Tool.destroy(params[:id])

    redirect_to "/stores/#{store.id}"
  end
end
