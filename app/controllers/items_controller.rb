class ItemsController < ApplicationController
  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
  end

  def new
  	@item = Item.new

  	3.times{
  		@item.discs.new
  	}
  end

  def create
  	@item = Item.new(item_params)
  	@item.save
  	redirect_to new_item_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to edit_item_path(@item.id)
  end

  private
  def item_params
  	params.require(:item).permit(:item_name,discs_attributes:[:disc_name, :item_id, :id])
  end
end
