class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @store.update({
      name: params[:tool][:name],
      price: params[:tool][:price],
      on_sale: params[:tool][:on_sale]
      })

      @tool.save

      redirect_to "/tools"
  end
end
