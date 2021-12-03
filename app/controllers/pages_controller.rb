class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.count #variável instância controller p/ view
    @total_fishcoins = 0
    Wallet.all.each do |wallet|
      @total_fishcoins += wallet.fishcoin_amount
    end
    @fishcoins_to_currency = @total_fishcoins * 17.35

  end
end
