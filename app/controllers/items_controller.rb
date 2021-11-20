class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(items_params)
    @items.user_id = current_user.id
    @item.save
    redirect_to item_path(@item)
  end


   def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :tags, :category_id, :nft, :value, photo: [])
  end

end
