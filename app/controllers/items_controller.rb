class ItemsController < ApplicationController

  def index
    @pingochi = Pingochi.find(params[:pingochi_id])
    @inventory = Inventory.new
    category_food = Category.find_by(name: "Food")
    @items = Item.where.not(category_id: category_food.id).where.not(id: Inventory.pluck(:item_id))
    @items_2 = Item.where(category_id: category_food.id)
    @items = @items + @items_2
    @items.shuffle
  end
end
