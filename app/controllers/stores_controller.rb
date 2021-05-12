class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
    store = Store.new({
      name: params[:store][:name],
      distance: params[:store][:distance].to_i,
      open: params[:store][:open] #change to boolean later for example, test.eql?("true")
      })

    store.save

    redirect_to '/stores'
  end
end
