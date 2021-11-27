class BattlesController < ApplicationController

  def new
    @pingochi1 = Pingochi.find(params[:pingochi_id])
    @pingochi2 = Pingochi.find(params[:opponent_id])
    @battle = Battle.new
  end

  def create
    @pingochi1 = Pingochi.find(params[:pingochi_id])
    @pingochi2 = Pingochi.find(params[:opponent_id])
    pingochi_winner = winner(@pingochi1, @pingochi2)
    @battle = Battle.new(pingochi1: @pingochi1, pingochi2: @pingochi2, pingochi_winner: pingochi_winner)
    if @battle.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @battle =Battle.find(params[:id])
  end

  def winner(pingochi1, pingochi2)
    @pingochi1
  end
end
