class ToolsController < ApplicationController
  def index
    @tools = Tool.discounted
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update({
      name: params[:name],
      price: params[:price],
      on_sale: params[:on_sale]
      })

      @tool.save
      redirect_to "/tools"
  end

  def destroy
    Tool.destroy(params[:id])

    redirect_to "/tools"
  end
end
