class ItemsController < ApplicationController
  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
  end

  private
  def item_params
  	params.require(:item).permit(:item_name)
  end
end
