class WalletsController < ApplicationController
  def edit
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
    @wallet.update(wallet_params)
  end

  private

  def wallet_params
    params.require(:wallet).permit(:fishcoin_amount)
  end
end
