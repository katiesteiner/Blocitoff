class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items
  end

  def show
    @item = Item.new
  end

  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error creating the to-do"
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted!"
    else
      flash[:error] = "\"#{@item.name}\"couldn't be deleted. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
