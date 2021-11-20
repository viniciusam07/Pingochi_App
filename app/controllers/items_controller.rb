class ItemsController < ApplicationController

  def index
    @pingochi = Pingochi.find(params[:pingochi_id])
    @inventory = Inventory.new
    @items = Item.where.not(id: Inventory.pluck(:item_id))
    # validar para não sumir do mercado a categoria Food
  end
end
