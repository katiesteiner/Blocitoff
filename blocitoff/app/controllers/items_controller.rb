class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items
  end

  def show
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new

    if @item.save
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error creating the to-do"
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
