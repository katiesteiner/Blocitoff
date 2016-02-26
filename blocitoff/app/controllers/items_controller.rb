class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      flash[:error] = "There was an error creating the to-do"
      redirect_to @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end
end
