class InventoriesController < ApplicationController

  def create
    pingochi = Pingochi.find(params[:pingochi_id])
    item = Item.find(params[:inventory][:item_id])
    if item.value <= current_user.wallet.fishcoin_amount
      Inventory.create!(user: current_user, pingochi: pingochi, item: item)
      current_user.wallet.update!(fishcoin_amount: current_user.wallet.fishcoin_amount - item.value)
      redirect_to pingochi_items_path(pingochi)
      flash[:notice] = "You bought #{item.name}!!!"
    else
      redirect_to pingochi_items_path(pingochi)
      flash[:notice] = "Your fishcoin balance it is not enough "
    end
  end
end
