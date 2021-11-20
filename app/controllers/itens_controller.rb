class ItensController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
   @itens = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item= Itens.new
  end

  def create
    @itens = Item.new(item_params)
    @itens.user_id = current_user.id


    @item.save

    redirect_to item_path(@item)
  end


   def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to itens_path
  end

  private

  def itens_params
    params.require(:itens).permit(:name, :description, :tags, :category_id, photos: [])
  end

end
