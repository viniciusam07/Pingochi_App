class PingochisController < ApplicationController

  def new
    @pingochi = Pingochi.new
  end

  def create
    @pingochi = Pingochi.new(pingochi_params)
    @pingochi.gender = ["male", "female"].sample
    @pingochi.user = current_user
    if @pingochi.save
      redirect_to pingochi_path(@pingochi)
    else
      render 'new'
    end
  end

  def edit
    @pingochi = Pingochi.find(params[:id])
    @items = Item.all
  end

  def show
    @pingochi = Pingochi.find(params[:id])
  end

  def slap
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.slap
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Toma essa'
    # o alerta da ação será com JSSS
  end

  def fish
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.fish
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Your Pingochi just fish more fishcoins!!!'
    # o alerta da ação será com JSSS
  end

  def feed
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.feed
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Alimentado! Energia: +20'
    # o alerta da ação será com JS
  end

  def sleep
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.sleep
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'ZZzZzZzZzZz'
    # o alerta da ação será com JS
  end

  def uti
    @pingochi = Pingochi.find(params[:id])
    @pingochi.uti
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = "Seu Pingochi chegou no limite e precisa de atendimento especial"
    # o alerta da ação será com JS
  end



  private

  def pingochi_params
    params.require(:pingochi).permit(:name, :specie)
  end
end
